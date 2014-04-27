# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  validates :user_id, :uniqueness => {:scope => :answer_id}
end
