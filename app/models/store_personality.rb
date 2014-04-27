# == Schema Information
#
# Table name: store_personalities
#
#  id             :integer          not null, primary key
#  store_id       :integer
#  personality_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  degree         :decimal(, )
#

class StorePersonality < ActiveRecord::Base
  belongs_to :store
  belongs_to :personality
end
