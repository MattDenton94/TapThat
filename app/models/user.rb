class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :shares

   # Follow associations
   has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
   has_many :following, through: :followed_users, source: :following

   has_many :following_users, foreign_key: :following_id, class_name: 'Follow'
   has_many :followers, through: :following_users, source: :follower
end
