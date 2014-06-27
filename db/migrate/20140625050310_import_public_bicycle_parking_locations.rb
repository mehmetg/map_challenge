class ImportPublicBicycleParkingLocations < ActiveRecord::Migration
  def up
  	require 'csv'
  	CSV.foreach('data/Bicycle_Parking__Public_.csv', headers: true) do |row|
    	dbrowHash =  row.to_hash
    	#Add the COL_ prefix to legalize the table column names!
    	dbrowHash.keys.each{ |k| dbrowHash["COL_"+k] = dbrowHash[k]; dbrowHash.delete(k)}
    	#adds to DB if the location listed had coordinates.
      if !dbrowHash["COL_COORDINATES"].nil?
        PublicBicycleParkingLocation.create!(dbrowHash)
  	  end 
    end
  end

  def down
  	#clear table!!!
  	PublicBicycleParkingLocation.destroy_all()
  end
end
