class MapController < ApplicationController
	layout 'application'  

  	def index
      #grabs all complete bike racks that have spaces. Avoids incomplete ones. 
      #Can be parametrized.
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
