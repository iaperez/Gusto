class CreateStorePersonalities < ActiveRecord::Migration
  def change
    create_table :store_personalities do |t|
      t.references :store, index: true
      t.references :personality, index: true

      t.timestamps
    end
  end
end
