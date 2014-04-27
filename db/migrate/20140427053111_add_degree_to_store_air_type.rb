class AddDegreeToStoreAirType < ActiveRecord::Migration
  def change
  	add_column :store_air_types, :degree, :decimal
  end
end
