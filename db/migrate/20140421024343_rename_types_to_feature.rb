class RenameTypesToFeature < ActiveRecord::Migration
  def change
		rename_table :types,:features
	end
end
