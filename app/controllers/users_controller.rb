class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # puts params.inspect
    @user = User.create(params.require(:user).permit(:username, :password))
      session[:user_id] = @user.id
      redirect_to '/page_requires_login'
  end
end
