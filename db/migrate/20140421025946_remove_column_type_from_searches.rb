class RemoveColumnTypeFromSearches < ActiveRecord::Migration
  def change
  	remove_column :searches, :type_id
	end
end
