# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :preferences
  has_many :responses
  has_many :questions, through: :responses


  def get_response_vector
    surveys = Survey.order(:id).all
    vector = []
    for ss in surveys
      for qq in ss.questions.order(:id).all
        for answer in qq.answers.order(:id).all
          if Response.where(user_id: self.id,answer_id: answer.id).count !=0
            vector.push(1)
          else
            vector.push(0)
          end
        end
      end
    end
    vector
  end
end
