# == Schema Information
#
# Table name: store_styles
#
#  id         :integer          not null, primary key
#  store_id   :integer
#  style_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  degree     :decimal(, )
#

class StoreStyle < ActiveRecord::Base
  belongs_to :store
  belongs_to :style
end
