class AddInterestReferenceToUserInterests < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_interests, :interest, null: false, foreign_key: true
  end
end
