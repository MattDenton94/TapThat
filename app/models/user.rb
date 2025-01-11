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
  has_many :follows
  has_many :followers, through: :follows, source: :follower
  has_many :followed_users, through: :follows, source: :followed

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
