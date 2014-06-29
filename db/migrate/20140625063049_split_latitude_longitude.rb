class SplitLatitudeLongitude < ActiveRecord::Migration
  # Add columns.
  # This is probably not needed, but long term may be useful.
  def up
    #Add needed columns
    add_column :public_bicycle_parking_locations, :COL_LATITUDE, :float
  	add_column :public_bicycle_parking_locations, :COL_LONGITUDE, :float
    PublicBicycleParkingLocation.reset_column_information
    
  	PublicBicycleParkingLocation.all.each do |row|
  		begin
        #parses lat, lng from coordinate string.
  			llPair = row.COL_COORDINATES.scan(/[-|+|\.]?\d+[\.]\d+/)
  		rescue 
  			#handles exception sets coordinates to 0,0
        put "Exception!"
        llPair = [0,0]
      end
        #update table with new values.
        row.update_attribute(:COL_LATITUDE, llPair[0].to_f)
        row.update_attribute(:COL_LONGITUDE, llPair[1].to_f)
        row.save!
        #puts llPair[0].to_f
        #puts llPair[1].to_f
  	end
  end

  def down
  	remove_column :public_bicycle_parking_locations, "COL_LATITUDE" 
  	remove_column :public_bicycle_parking_locations, "COL_LONGITUDE"
  end
end
