class UserController < ApplicationController
 
	layout 'application'

  def index
  	@users = User.sorted
  end

  def show
    
  	@user = @current_user
    @user_updated_at = @user.updated_at.strftime "%d/%m/%Y %H:%M"

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
  	@user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated successfully."
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('edit')
    end
  end

  def delete
    @user = @current_user
  end

  def destroy
    @user = @current_user.destroy
    flash[:notice] = "User successfully deleted"
    redirect_to(:controller => 'access', :action => 'login')
  end 

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :username, :email, :mobile, :student_number, :password)
  end
end

