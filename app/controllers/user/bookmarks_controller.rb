class User::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def create
    @post = Post.find(params[:post_id])
    #bookmark = @post.bookmarks.new(user_id: current_user.id)
    bookmark = current_user.bookmarks.find_by(post_id: post.id)
    bookmark.save
    redirect_to posts_path
      #redirect_to posts_path
    #if bookmark.save
      #redirect_to posts_path
    #else
      #redirect_to post_path(@post.id)
    #end
  end

  def destroy
    @post = Post.find(params[:post_id])
    #bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    bookmark = current_user.bookmarks.find_by(post_id: post.id)
    bookmark.destroy
    redirect_to post_path(post)
    #if bookmark.present?
        #bookmark.destroy
        #redirect_to posts_path
    #else
        #redirect_to post_path(@post.id)
    #end
  end
  
end
