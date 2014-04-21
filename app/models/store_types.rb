class StoreTypes < ActiveRecord::Base
  belongs_to :store
  belongs_to :type
end
