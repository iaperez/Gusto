class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :category, index: true
      t.references :personality, index: true

      t.timestamps
    end
  end
end
