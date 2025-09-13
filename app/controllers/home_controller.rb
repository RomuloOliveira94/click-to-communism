class HomeController < ApplicationController
  before_action :ensure_session_id

  def index
    @click = Click.new
    @clicks_count = Click.count
    @clicks_from_session = Click.by_session(user_session_id).count
  end

  def create
    @click = Click.new(click_params.merge(session_id: user_session_id))
    if @click.save
      @clicks_count = Click.count
      @clicks_from_session = Click.by_session(user_session_id).count
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

  def ensure_session_id
    unless user_session_id.present?
      cookies.permanent[:user_session_id] = SecureRandom.uuid
    end
  end

  def user_session_id
    @user_session_id ||= cookies[:user_session_id]
  end
end
