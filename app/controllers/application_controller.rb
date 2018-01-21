class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def ensure_logged_in
    if !session[:user_id]
      flash[:alert] = ["You need to be logged in to do that!"]
      redirect_to new_session_url
    end
  end

  def ensure_user_picture
    if session[:user_id] != @picture.user_id
      flash[:alert] = ["This isn't yours to change!"]
      redirect_to root_path
    end
  end
end
