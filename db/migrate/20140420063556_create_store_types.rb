class CreateStoreTypes < ActiveRecord::Migration
  def change
    create_table :store_types do |t|
      t.references :store, index: true
      t.references :type, index: true
      t.decimal :degree

      t.timestamps
    end
  end
end
