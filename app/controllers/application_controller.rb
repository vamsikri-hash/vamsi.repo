class ApplicationController < ActionController::Base
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource)
    blog_posts_path
  end

  def after_sign_in_path_for(resource)
    blog_posts_path
  end


end
