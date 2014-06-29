class InfoViewController < ApplicationController
	layout false  
	def index
		#get columns that we need to display.
		@locationHash = PublicBicycleParkingLocation.find(params[:id]).attributes
		#make column names pretty and ignore the ones we do not need.
		#may be done more efficiently, but column size is small and not likely to grow.
		@locationHash.keys.each do |k|
			if (k.include?("COL_") && 
				!k.include?("COL_LATITUDE") &&
				!k.include?("COL_LONGITUDE") &&
				#!k.include?("COL_COORDINATES") &&
				!@locationHash[k].nil? && 
				!@locationHash[k].to_s.empty?)
				#puts @locationHash[k]
				#puts @locationHash[k].to_s.size
				@locationHash[k.split("COL_")[1]] = @locationHash[k] 
			end
			@locationHash.delete(k)
		end
		#puts @locationHash.inspect
	end

end
