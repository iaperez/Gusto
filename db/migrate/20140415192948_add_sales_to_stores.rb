class AddSalesToStores < ActiveRecord::Migration
  def change
    add_column :stores, :sales, :integer
  end
end
