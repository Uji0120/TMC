class User::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), {success: "投稿しました。"}
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @Post.update(post_params)
      redirect_to post_path(@post.id), flash: {success: "投稿内容を更新しました。" }
    else
      #@book = Book.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introdu, :image)
  end

  
end
