class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: 'User was successfully created. Please log in.'
    else
      puts @user.errors.full_messages # This will print out any validation errors
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end

end
