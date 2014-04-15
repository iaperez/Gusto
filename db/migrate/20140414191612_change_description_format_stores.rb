class ChangeDescriptionFormatStores < ActiveRecord::Migration
  def change
  	change_column :stores, :description, :text
	end
end
