class ChangePersonalityTypeName < ActiveRecord::Migration
  def change
  	rename_column :searches, :personality_id, :types_id
	end
end
