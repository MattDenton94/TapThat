class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_reference :users, :post, null: false, foreign_key: true
    add_reference :users, :comment, null: false, foreign_key: true
    add_reference :users, :follow, null: false, foreign_key: true
    add_reference :users, :message, null: false, foreign_key: true
    add_reference :users, :user_interest, null: false, foreign_key: true
    add_reference :users, :like, null: false, foreign_key: true
    add_reference :users, :share, null: false, foreign_key: true
  end
end
