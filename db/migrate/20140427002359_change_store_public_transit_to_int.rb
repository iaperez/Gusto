class ChangeStorePublicTransitToInt < ActiveRecord::Migration
	def up
	  connection.execute(%q{
	    alter table stores
	    alter column public_transit
	    type integer using cast(public_transit as integer)
	  })
	end
end
