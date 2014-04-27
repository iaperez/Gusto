# == Schema Information
#
# Table name: air_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AirType < ActiveRecord::Base
end
