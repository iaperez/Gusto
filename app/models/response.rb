class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  validates :email, uniqueness: true

end
