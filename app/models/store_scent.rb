class StoreScent < ActiveRecord::Base
  belongs_to :store
  belongs_to :scent
end
