class AddCustomerServiceToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :customer_service, :integer
  end
end
