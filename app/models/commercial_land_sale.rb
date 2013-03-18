class CommercialLandSale < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/7dbz-yi8h/rows.csv?accessType=DOWNLOAD'
  self.source_key = 'Sale #'

end
