class PublicSafetyLocation < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/6ym2-385s/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Name"

end
