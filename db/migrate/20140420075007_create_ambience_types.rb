class CreateAmbienceTypes < ActiveRecord::Migration
  def change
    create_table :ambience_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
