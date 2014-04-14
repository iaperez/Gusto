class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :prices
      t.integer :busyness
      t.integer :noise
      t.decimal :adventure
      t.decimal :convenience
      t.decimal :bargain
      t.string :website
      t.string :description

      t.timestamps
    end
  end
end
