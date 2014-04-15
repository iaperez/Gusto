class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.references :store, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
