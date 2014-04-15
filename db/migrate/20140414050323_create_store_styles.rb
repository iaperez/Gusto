class CreateStoreStyles < ActiveRecord::Migration
  def change
    create_table :store_styles do |t|
      t.references :store, index: true
      t.references :style, index: true

      t.timestamps
    end
  end
end
