class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @blog_post.likes.create(user_id: current_user.id)
    #redirect_to blog_posts_path
    redirect_back(fallback_location: blog_posts_path)
  end

  def destroy
    @like.destroy
    #redirect_to blog_posts_path
    redirect_back(fallback_location: blog_posts_path)
  end

  private

  def find_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def find_like
    @like = @blog_post.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, blog_post_id: params[:blog_post_id]).exists?
  end
end
