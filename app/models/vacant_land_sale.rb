class VacantLandSale < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/iig4-49xp/rows.csv?accessType=DOWNLOAD'
  self.source_key = 'Sale #'

end
