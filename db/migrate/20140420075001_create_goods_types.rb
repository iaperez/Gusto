class CreateGoodsTypes < ActiveRecord::Migration
  def change
    create_table :goods_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
