class AddDiscountsToStore < ActiveRecord::Migration
  def change
    add_column :stores, :discounts, :integer
  end
end
