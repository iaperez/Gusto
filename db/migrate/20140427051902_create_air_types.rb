class CreateAirTypes < ActiveRecord::Migration
  def change
    create_table :air_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
