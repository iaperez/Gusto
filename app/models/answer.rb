class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :users, through: :answers
  mount_uploader :image, ImageUploader
end
