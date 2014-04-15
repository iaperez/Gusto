class AddDegreeToStoreMusicStyles < ActiveRecord::Migration
  def change
    add_column :store_music_styles, :degree, :decimal
  end
end
