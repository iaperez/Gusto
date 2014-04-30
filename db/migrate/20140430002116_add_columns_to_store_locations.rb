class AddColumnsToStoreLocations < ActiveRecord::Migration
  def change
  	add_column :store_locations, :city, :string
		add_column :store_locations, :postal_code, :string
		add_column :store_locations, :state, :string
		add_column :store_locations, :country, :string
	end
end
