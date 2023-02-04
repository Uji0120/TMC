class User::CommentsController < ApplicationController
 
 def create
    post = Post.find(params[:post_id])
    comment = current_user.comment.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to posts_path(post)
 end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
 
end
