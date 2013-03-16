class PoliceCall < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/4gss-84dk/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Incident Number"

end
