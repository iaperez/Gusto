# == Schema Information
#
# Table name: music_styles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MusicStyle < ActiveRecord::Base
end
