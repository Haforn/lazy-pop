class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  helper_method :current_user

   private

    def confirm_logged_in
      unless session[:user_id]
        flash[:notice_fail] = "Please log in"
        redirect_to(:controller => 'access', :action => 'login')
        return false # halts the before_action
      else
        return true
      end
    end

    def current_user
      if session[:user_id]
        current_user ||= User.find(session[:user_id])
      end
    end

end
