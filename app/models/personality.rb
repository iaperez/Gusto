# == Schema Information
#
# Table name: personalities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Personality < ActiveRecord::Base
end
