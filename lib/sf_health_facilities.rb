require "sf_health_facilities/version"
require "unirest"

module SfHealthFacilities
  class Facilities

    attr_reader :facility_name, :facility_type, :location_address

    def initialize(hash)
      @facility_name = hash["facility_name"]
      @facility_type = hash["facility_type"]
      @location_address = hash["location_address"]
    end

    def self.all
      facility_array = Unirest.get("https://data.sfgov.org/resource/sci7-7q9i.json").body
      facilities = []
      facility_array.each do |facility_hash|
        facilities << Facilities.new(facility_hash)
      end
      return facilities
    endF
  end
end
