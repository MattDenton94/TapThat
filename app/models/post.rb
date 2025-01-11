class Post < ApplicationRecord
  # all things associated to the post gets deleted when post is deleted (d&d)
  belongs_to :user, dependent: :destroy
end
