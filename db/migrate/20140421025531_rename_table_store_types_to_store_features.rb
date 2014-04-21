class RenameTableStoreTypesToStoreFeatures < ActiveRecord::Migration
  def change
  	rename_table :store_types, :store_features
	end
end
