class AddSizeToStore < ActiveRecord::Migration
  def change
    add_column :stores, :size, :integer
  end
end
