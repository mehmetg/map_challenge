class MapController < ApplicationController
	layout 'application'  
	
  	def index
      @locations = PublicBicycleParkingLocation.all
      puts @locations.count
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat  location.COL_LATITUDE
        marker.lng  location.COL_LONGITUDE
        marker.json({:id => location.id})
      end
    end
  	def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
      puts "meh!"
    end
end
