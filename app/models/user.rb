class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }
  after_initialize :init

  def init
    return unless new_record?

    self.posts_counter = 0
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
