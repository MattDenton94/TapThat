class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :user_interests
  has_many :comments
  has_many :likes
  has_many :shares

  # Follow associations
  has_many :follower_associations, foreign_key: :following_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :follower_associations, source: :follower

  has_many :following_associations, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :following, through: :following_associations, source: :following

  def follow(user)
    Follow.find_or_create_by(follower: self, following: user)
  end

  def unfollow(user)
    follow_record = Follow.find_by(follower: self, following: user)
    follow_record.destroy if follow_record
  end

  # Check if following a user
  def following?(user)
    following.include?(user)
  end
end
