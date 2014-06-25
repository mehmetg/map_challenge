class CreatePublicBicycleParkingLocations < ActiveRecord::Migration
	def getColumns()
		headers = nil
		#Assumes the first line in the file is the column headers
		File.open('data/Bicycle_Parking__Public_.csv', "r") do |fi|
			require 'csv'
			begin	
				headers = CSV.parse_line(fi.readline)
			rescue EOFError
			#if file is not there or empty.
				headers = nil
			ensure
				fi.close unless fi.nil?
			end 
		end
		return headers   
	end

  def up
  	columns = self.getColumns()
  	if columns == nil
  		puts "Header/File problem!!!"
  		return
  	end
	create_table :public_bicycle_parking_locations do |t|
		columns.each do |colid|
			t.string "COL_#{colid}"
		end
		t.timestamps
	end
  end
  
  def down
  	drop_table :public_bicycle_parking_locations
  end

end