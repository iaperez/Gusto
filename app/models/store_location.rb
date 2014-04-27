# == Schema Information
#
# Table name: store_locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  store_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class StoreLocation < ActiveRecord::Base
  belongs_to :store
end
