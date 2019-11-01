class AddSlugToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :slug, :string
  end
end
