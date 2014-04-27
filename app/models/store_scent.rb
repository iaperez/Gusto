# == Schema Information
#
# Table name: store_scents
#
#  id         :integer          not null, primary key
#  store_id   :integer
#  scent_id   :integer
#  degree     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class StoreScent < ActiveRecord::Base
  belongs_to :store
  belongs_to :scent
end
