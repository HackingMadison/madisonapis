class Property < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/u7ns-6d4x/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Parcel"

end
