# == Schema Information
#
# Table name: location_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class LocationType < ActiveRecord::Base
end
