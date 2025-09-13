class HomeController < ApplicationController
  def index
    @click = Click.new
  end

  def create
    @click = Click.new(click_params)
    if @click.save
      redirect_to root_path, notice: "Click recorded successfully."
    else
      render :index
    end
  end

  private

  def click_params
    params.require(:click).permit(:ip_address, :user_agent)
  end
end
