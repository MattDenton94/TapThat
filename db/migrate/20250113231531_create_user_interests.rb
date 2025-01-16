class CreateUserInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :user_interests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
