class PollingPlace < MadisonApi
  include Mongoid::Document

  field :ward, type: Integer
  field :aldermanic_district, type: Integer

  self.url = 'https://data.cityofmadison.com/api/views/rtyh-6ucr/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Ward"

end
