# == Schema Information
#
# Table name: store_music_styles
#
#  id             :integer          not null, primary key
#  store_id       :integer
#  music_style_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  degree         :decimal(, )
#

class StoreMusicStyle < ActiveRecord::Base
  belongs_to :store
  belongs_to :music_style
end
