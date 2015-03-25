class UsersController < ApplicationController
 
	layout 'application'

  def show
  end 

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User is added"
      redirect_to user_path(current_user.id)
    else
      render('new')
    end
  end 

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if user_params[:password].present?
      found_user = User.find(current_user.id)
      if found_user
        authorired_user = found_user.authenticate(user_params[:password])
      end
    end
    if authorired_user
      if @user.update_attributes(user_params)
        flash[:notice] = "User updated successfully."
        redirect_to user_path(current_user.id)
      else
        render('edit')
      end
    else
      flash[:notice_fail] = "Please use your password"
      render('edit')
    end
  end

  def delete
  end

  def destroy
    if current_user.destroy
      flash[:notice] = "User successfully deleted"
      session[:user_id] = nil
      session[:username] = nil
      redirect_to login_path
    end
  end 

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :username, :email, :mobile, :student_number, :password)
  end
end

