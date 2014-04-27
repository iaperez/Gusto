# == Schema Information
#
# Table name: character_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CharacterType < ActiveRecord::Base
end
