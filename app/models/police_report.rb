class PoliceReport < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/d686-rvcw/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Incident ID"

end
