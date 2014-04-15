class CreateScents < ActiveRecord::Migration
  def change
    create_table :scents do |t|
      t.string :name

      t.timestamps
    end
  end
end
