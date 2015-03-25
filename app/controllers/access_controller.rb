class AccessController < ApplicationController

  def login
  	# login form
    if session[:user_id]
      redirect_to(:controller => 'users', :action => 'show', :id => session[:user_id])
    end
  end

  def attempt_login 
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first
	  	if found_user
	  		authorired_user = found_user.authenticate(params[:password])
	  	end
  	end
  	if authorired_user
  		# mark user as logged in
      session[:user_id] = authorired_user.id
      session[:username] = authorired_user.username
  		flash[:notice] = "You are now logged in."
  		redirect_to(:controller => "users", :action => 'show', :id => authorired_user.id)
  	else 
  		flash[:notice_fail] = "Invalid username/password combination"
  		redirect_to login_path
  	end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

end
