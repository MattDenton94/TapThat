class Interest < ApplicationRecord
  has_many :user_interests
  has_many :users, through: :user_interests
  has_many :post_interests
  has_many :posts, through: :post_interests
end
