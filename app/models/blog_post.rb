class BlogPost < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_validation :set_slug, only: [:create, :update]

  def to_param
    "#{id}-#{slug}"
  end

  #validates :title, presence: true
  #validates :content, presence: true
  validate :validate_title_and_content

  private

  def validate_title_and_content
    if self.title.strip == ""
      errors.add(:blog_post, "Are you trying to write Title less content!")
    elsif self.title.length < 10
      errors.add(:blog_post, "Title must be minimum of 10 charcters!")
    elsif self.content.strip == ""
      errors.add(:blog_post, "Are  you trying to submit content less title..!")
    elsif self.content.length < 100
      errors.add(:blog_post, "Write a minimum content of 100 charcters..!")
    end
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
