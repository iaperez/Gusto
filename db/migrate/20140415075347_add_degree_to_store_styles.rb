class AddDegreeToStoreStyles < ActiveRecord::Migration
  def change
    add_column :store_styles, :degree, :decimal
  end
end
