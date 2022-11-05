class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy

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
