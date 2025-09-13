class HomeController < ApplicationController
  def index
    @click = Click.new
    @clicks_count = Click.count
    @clicks_from_ip = Click.where(ip_address: request.remote_ip).count
  end

  def create
    @click = Click.new(click_params)
    if @click.save
      @clicks_count = Click.count
      @clicks_from_ip = Click.where(ip_address: request.remote_ip).count
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: "Click was successfully created." }
      end
    else
      render :index
    end
  end

  private

  def click_params
    params.require(:click).permit(:ip_address, :user_agent)
  end
end
