class AddParkingToStore < ActiveRecord::Migration
  def change
    add_column :stores, :parking, :integer
  end
end
