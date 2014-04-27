# == Schema Information
#
# Table name: store_air_types
#
#  id          :integer          not null, primary key
#  store_id    :integer
#  air_type_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  degree      :decimal(, )
#

class StoreAirType < ActiveRecord::Base
  belongs_to :store
  belongs_to :air_type
end
