class Park < MadisonApi
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :acreage, type: Float
  field :source_id, type: Integer
  field :coordinates, type: Array
  field :address

  self.source_key = "Id"
  self.url = 'https://data.cityofmadison.com/api/views/svr6-6gvb/rows.csv?accessType=DOWNLOAD'

  reverse_geocoded_by :coordinates

  def self.skip_fields
    ["Id"]
  end

  def location=(string)
    self.coordinates = [string.split(", ")[1].gsub(")","").to_f, string.split(", ")[0].gsub("(","").to_f]
  end

end
