class AddTextAttributesToStore < ActiveRecord::Migration
  def change
    add_column :stores, :public_transit, :string
    add_column :stores, :stores_nearby, :string
    add_column :stores, :accessible, :string
  end
end
