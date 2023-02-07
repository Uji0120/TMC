class Admin::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end
  
  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新に成功しました。"
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end

  # def unsubscribe
  # end

  # def withdrawal
  #   @user = User.find(params[:id])
  #   @user.update(is_delete: true)
  #   reset_session
  #   redirect_to root_path
  # end
  
  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :introduction, :image, :is_delete)
  end
end
