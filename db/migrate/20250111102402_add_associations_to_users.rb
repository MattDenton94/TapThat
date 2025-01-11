class AddAssociationsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :post, null: false, foreign_key: true
    add_reference :users, :comment, null: false, foreign_key: true
    add_reference :users, :follow, null: false, foreign_key: true
    add_reference :users, :user_interest, null: false, foreign_key: true
    add_reference :users, :like, null: false, foreign_key: true
    add_reference :users, :share, null: false, foreign_key: true
  end
end
