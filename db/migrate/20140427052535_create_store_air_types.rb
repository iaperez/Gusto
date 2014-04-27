class CreateStoreAirTypes < ActiveRecord::Migration
  def change
    create_table :store_air_types do |t|
      t.references :store, index: true
      t.references :air_type, index: true

      t.timestamps
    end
  end
end
