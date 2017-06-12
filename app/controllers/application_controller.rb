class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    # return this user if session[:user_id] stored by our session hash,
    # then find the corresponding user in the db
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # returns true if I have a current user, else returns false
    !!current_user
  end

  def require_user
    if !logged_in?
      # if not logged in, i'll redirect the user
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
