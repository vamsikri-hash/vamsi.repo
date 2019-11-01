class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user

  validate :validate_comment
  private

  def validate_comment
    if  self.comment.strip==""
      errors.add(:comment,"comment can't be empty!")
    end
  end
end
