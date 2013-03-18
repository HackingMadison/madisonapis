class ReportAProblem < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/kfv2-f9ss/rows.csv?accessType=DOWNLOAD'
  self.source_key = 'Request Type'

end
