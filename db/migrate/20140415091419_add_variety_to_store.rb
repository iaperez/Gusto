class AddVarietyToStore < ActiveRecord::Migration
  def change
    add_column :stores, :variety, :integer
  end
end
