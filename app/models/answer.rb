# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  content     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#

class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :users, through: :answers
  mount_uploader :image, ImageUploader
end
