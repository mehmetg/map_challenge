class InfoViewController < ApplicationController
  def index
      @location = PublicBicycleParkingLocation.first.to_hash
  end
end
