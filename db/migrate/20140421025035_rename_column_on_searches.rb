class RenameColumnOnSearches < ActiveRecord::Migration
  def change
  	rename_column :searches, :types_id, :features_id
	end
end
