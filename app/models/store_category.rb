# == Schema Information
#
# Table name: store_categories
#
#  id          :integer          not null, primary key
#  store_id    :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class StoreCategory < ActiveRecord::Base
  belongs_to :store
  belongs_to :category
end
