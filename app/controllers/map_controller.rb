# Controls the information to be displayed on the map. When the map initializes
# it builds and returns a hash of the applicable information to the view to be converted
# to json.
class MapController < ApplicationController
	layout 'application'  

    # Grabs all complete bike racks that have spaces. Avoids incomplete ones. 
    # Can be parametrized for more display options.
  	def index  
      locations = PublicBicycleParkingLocation.all.where.not(COL_SPACES: 0).where(COL_1_STATUS: 'COMPLETE')
      #builds a hash to be converted to json data in the view,
      #to be used by the js.
      @hash = Gmaps4rails.build_markers(locations) do |location, marker|
        #for the marker.
        marker.lat  location.COL_LATITUDE
        marker.lng  location.COL_LONGITUDE
        #for the infowindow query. We're using primary key.
        marker.json({:id => location.id})
      end
    end

end
