# == Schema Information
#
# Table name: store_locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  store_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class StoreLocation < ActiveRecord::Base
  belongs_to :store
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      # populate your model
      obj.street_address = geo.street_address
      obj.city    = geo.city
      obj.postal_code = geo.postal_code
      obj.formatted_address = geo.formatted_address
      obj.state = geo.state
      obj.country = geo.country_code
    end
  end
  after_validation :geocode,  :if => :address_changed?
  after_validation :reverse_geocode

end
