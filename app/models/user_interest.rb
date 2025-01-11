class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest
  validates :user_id, uniqueness: { scope: :interest_id, message: "already added this interest" }
end
