class BlogPostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @blog_posts = BlogPost.order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end

  def new
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to blog_posts_path
    end
    @blog_post = BlogPost.new
  end

  def create
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to blog_posts_path
    end
    @blog_post = BlogPost.new(blogpost_params)
    if @blog_post.save
      redirect_to action: "index"
    else
      flash[:danger] = @blog_post.errors.values.join(", ")
      redirect_to action: "new"
    end
  end

  def update
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to blog_posts_path
    end
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blogpost_params)
      redirect_to @blog_post
    else
      render "edit"
    end
  end

  def edit
    unless current_user.admin?
      flash[:danger] = "You are not allowed to access this page."
      redirect_to blog_posts_path
    end
    @blog_post = BlogPost.find(params[:id])
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to action: "index"
  end

  private

  def blogpost_params
    params[:blog_post].permit(:title, :content)
  end

end
