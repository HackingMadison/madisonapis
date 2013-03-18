class BusStop < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/f5sy-kcer/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Stop ID"

end
