class AddUserRefToPreferences < ActiveRecord::Migration
  def change
    add_reference :preferences, :user, index: true
  end
end
