class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    #session[:user_id] ##old way before current_user was made
    !!current_user
  end

  def current_user
    # Methods built in controllers do not permeate to your ActionView part of code
    ## You can't call this in your html.erb unless you say explicitly...
    # This is a HELPER METHOD, please let me use it in my view (this is done on line 5)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
