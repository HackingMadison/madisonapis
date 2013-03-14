class PollingPlace < MadisonApi
  include Mongoid::Document

  field :ward, type: Integer
  field :aldermanic_district, type: Integer

  def self.url
    'https://data.cityofmadison.com/api/views/rtyh-6ucr/rows.csv?accessType=DOWNLOAD'
  end

end
