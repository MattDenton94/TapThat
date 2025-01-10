class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
