class AddThumbnailsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :thumbnail1, :string
    add_column :stores, :thumbnail2, :string
    add_column :stores, :thumbnail3, :string
  end
end
