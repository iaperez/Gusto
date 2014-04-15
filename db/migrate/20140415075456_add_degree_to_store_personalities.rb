class AddDegreeToStorePersonalities < ActiveRecord::Migration
  def change
    add_column :store_personalities, :degree, :decimal
  end
end
