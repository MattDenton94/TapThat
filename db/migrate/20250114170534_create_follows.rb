class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.integer :follower
      t.integer :following

      t.timestamps
    end
  end
end
