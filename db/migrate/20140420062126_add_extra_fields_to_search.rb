class AddExtraFieldsToSearch < ActiveRecord::Migration
  def change
		add_column :searches, :type_id, :integer
		add_column :searches, :space_type_id, :integer
	  add_column :searches, :location_type_id, :integer
		add_column :searches, :goods_type_id, :integer
		add_column :searches, :ambience_type_id, :integer
		add_column :searches, :character_type_id, :integer	
	end
end
