class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :location

      t.timestamps
    end
  end
end
