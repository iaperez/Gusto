class AddIImgUrlToStores < ActiveRecord::Migration
  def change
    add_column :stores, :img_url, :string
  end
end
