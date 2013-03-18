class CityEvent < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/gxhk-44q9/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Event ID"

end
