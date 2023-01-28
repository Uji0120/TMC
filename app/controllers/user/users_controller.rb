class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.post
    @post = Post.new
    
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_id)
    @bookmark_list = Post.find(bookmarks)
    
  end
  
  def index
    @user = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "更新に成功しました。"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    :introduction, :image, :is_deleted)
  end

end
