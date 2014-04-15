class StoreMusicStyle < ActiveRecord::Base
  belongs_to :store
  belongs_to :music_style
end
