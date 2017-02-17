class UsersController < ApplicationController
  def show
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
