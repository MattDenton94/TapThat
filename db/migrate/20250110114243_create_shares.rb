class CreateShares < ActiveRecord::Migration[7.2]
  def change
    create_table :shares do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
