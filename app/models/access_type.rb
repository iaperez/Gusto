# == Schema Information
#
# Table name: access_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AccessType < ActiveRecord::Base
end
