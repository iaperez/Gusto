class CreateStoreMusicStyles < ActiveRecord::Migration
  def change
    create_table :store_music_styles do |t|
      t.references :store, index: true
      t.references :music_style, index: true

      t.timestamps
    end
  end
end
