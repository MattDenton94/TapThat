class CreateShares < ActiveRecord::Migration[7.2]
  def change
    create_table :shares do |t|
      t.timestamps
    end
  end
end
