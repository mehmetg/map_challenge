class SplitLatitudeLongitude < ActiveRecord::Migration
  def up
  	change_table :public_bicycle_parking_locations do |t|
  		t.float "COL_LATITUDE" 
  		t.float "COL_LONGITUDE"
  	end

  	PublicBicycleParkingLocation.all.each do |row|
  		begin
  			llPair = row.COL_COORDINATES.scan(/[-|+|\.]?\d+[\.]\d+/)
  		rescue 
  			#handles malformed string that should not parse into float
  			#should be more specific but doesn't hurt as is.
  			#puts row.COL_LOCATION
  		ensure
  			llPair = [0,0]
  		end
  		row.COL_LATITUDE = llPair[0].to_f
  		row.COL_LONGITUDE = llPair[1].to_f
  		row.save
  	end
  end

  def down
  	remove_column :public_bicycle_parking_locations, "COL_LATITUDE" 
  	remove_column :public_bicycle_parking_locations, "COL_LONGITUDE"
  end
end
