class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter
  validates :title, presence: true,  length: { maximum: 250,
    too_long: " 250 characters is the maximum allowed" }
  validates :comments_counter, presence: true,  numericality: { only_integer: true, :greater_than_or_equal_to 0 }
  validates :likes_counter, presence: true,  numericality: { only_integer: true, :greater_than_or_equal_to 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
