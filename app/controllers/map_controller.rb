class MapController < ApplicationController
	layout 'application'  
	
  	def index
  	end

  	def gmaps4rails_infowindow
  		"<p> content! </p>"
    end

	def gmaps4rails_title
		"<p> title! </p>"
    end
end
