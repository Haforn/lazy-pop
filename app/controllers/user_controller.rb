class UserController < ApplicationController
 
	layout 'application'

  def show
  end 

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User is added to the list"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end 

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User updated successfully."
      redirect_to(:action => 'show', :id => current_user.id)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    current_user.destroy
    flash[:notice] = "User successfully deleted"
    redirect_to(:controller => 'access', :action => 'login')
  end 

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :username, :email, :mobile, :student_number, :password)
  end
end

