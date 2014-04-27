class CreateStoreOwners < ActiveRecord::Migration
  def change
    create_table :store_owners do |t|
      t.references :store, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
