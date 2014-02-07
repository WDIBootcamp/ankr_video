class UsersController < ApplicationController
  def new
  	@user = User.new()
    #sign up
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save #if save happens
  		sign_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    render :show
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end #class


