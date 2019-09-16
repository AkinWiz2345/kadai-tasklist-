class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = 'ユーザの登録に失敗しました。'
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
