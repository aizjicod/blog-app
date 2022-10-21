class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter
  validates :title, presence: true, length: { maximum: 250, too_long: ' 250 characters is the maximum allowed' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_initialize :init

  def init
    return unless new_record?

    self.likes_counter = 0
    self.comments_counter = 0
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
