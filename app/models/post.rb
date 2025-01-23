class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :post_interests
  has_many :interests, through: :post_interests
  has_many :comments
  has_one_attached :image
end
