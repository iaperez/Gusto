class AddAccessTypeToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :access_type_id, :integer	
  end
end
