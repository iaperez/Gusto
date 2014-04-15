class CreateStoreScents < ActiveRecord::Migration
  def change
    create_table :store_scents do |t|
      t.references :store, index: true
      t.references :scent, index: true
      t.decimal :degree

      t.timestamps
    end
  end
end
