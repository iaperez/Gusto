# == Schema Information
#
# Table name: goods_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GoodsType < ActiveRecord::Base
end
