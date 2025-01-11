class ChangeForeignKeyConstraintsOnUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :post_id, true
    change_column_null :users, :comment_id, true
    change_column_null :users, :follow_id, true
    change_column_null :users, :like_id, true
    change_column_null :users, :share_id, true
  end
end
