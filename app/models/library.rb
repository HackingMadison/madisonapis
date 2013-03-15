class Library < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/hb5z-buaz/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Library"

end
