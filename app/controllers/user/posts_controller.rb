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

    end
  end

  def index
  end

  def show
  end

  def edit
  end
end
