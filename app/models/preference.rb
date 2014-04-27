# == Schema Information
#
# Table name: preferences
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Preference < ActiveRecord::Base
  belongs_to :user
end
