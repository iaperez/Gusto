class StorePersonality < ActiveRecord::Base
  belongs_to :store
  belongs_to :personality
end
