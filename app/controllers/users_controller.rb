class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = 'Signed Up'
      redirect_to links_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
