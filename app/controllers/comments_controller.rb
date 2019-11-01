class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.user_name=current_user.email
    if @comment.save
      CommentMailer.send_comment(@comment).deliver_later
      redirect_to blog_post_path(@blog_post)
    else
      flash[:danger] = @comment.errors.values.join(', ')
      redirect_to blog_post_path(@blog_post)
    end
  end
  def destroy
   @blog_post=BlogPost.find(params[:blog_post_id])
   @comment=@blog_post.comments.find(params[:id])
   @comment.destroy
   redirect_to blog_post_path(@blog_post)
  end
  private

  def comment_params
    params[:comment].permit(:comment)
  end
end
