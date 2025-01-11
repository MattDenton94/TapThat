class CreateShares < ActiveRecord::Migration[7.2]
  def change
    create_table :shares do |t|
      t.integer :post_id

      t.timestamps
    end
  end
end
