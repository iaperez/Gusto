class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :answer, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
