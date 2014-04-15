class AddOrganizationToStore < ActiveRecord::Migration
  def change
    add_column :stores, :organization, :integer
  end
end
