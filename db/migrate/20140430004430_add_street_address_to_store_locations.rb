class AddStreetAddressToStoreLocations < ActiveRecord::Migration
  def change
  	add_column :store_locations,:street_address,:string
	end
end
