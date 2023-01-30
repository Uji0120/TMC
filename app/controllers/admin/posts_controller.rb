class Admin::PostsController < ApplicationController
  def new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    
  end

  def edit
    @post = Post.find(params[:id])
  end
end
