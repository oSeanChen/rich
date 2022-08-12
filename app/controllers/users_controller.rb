class UsersController < ApplicationController
  def sign_in
    @user = User.new
  end
  
  def sign_up
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      # flash[:notice] = "會員建立成功" #可以整合到下面
      redirect_to "/", notice: "會員建立成功"
    else
      render :sign_up
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
