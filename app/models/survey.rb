# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :answers, :through => :questions
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates_presence_of :name

end
