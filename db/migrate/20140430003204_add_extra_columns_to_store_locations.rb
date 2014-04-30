class AddExtraColumnsToStoreLocations < ActiveRecord::Migration
  def change
  	add_column :store_locations, :formatted_address, :string
	end
end
