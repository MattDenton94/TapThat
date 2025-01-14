class AddMediaUrlToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :media_url, :string
  end
end
