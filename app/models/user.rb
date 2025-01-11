class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :shares
  has_many :follows
  has_many :followers, through: :follows, source: :follower
  has_many :followed_users, through: :follows, source: :followed
end
