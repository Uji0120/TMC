class User::PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @genres = Genre.all
    if @post.save!
      redirect_to post_path(@post.id), {success: "投稿しました。"}
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end

  def index
    #@posts = Post.all
    @user = current_user
    @genres = Genre.all
    #@tags = Tag.all
    @posts = params[:title].present? ? Tag.find(params[:title]).posts : Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
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
      render :edit
    end
  end
  
  def search
    if params[:keyword].present?
      @posts = Posts.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
      @genres = Genre.all
      @user = current_user
      redirect_to posts_path
    else
      @posts = Post.all
      @genres = Genre.all
      @user = current_user
      render :index
    end
  end
  
  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :image, :genre_id, :password, :password_confirmation,) 
  end

  
end
