class PollingPlace < MadisonApi
  include Mongoid::Document

  field :ward, type: Integer
  field :aldermanic_district, type: Integer

  self.url = 'https://data.cityofmadison.com/api/views/rtyh-6ucr/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Ward"

  def address=(string)
    array = string.split("\n")
    self[:address] = "#{array[0]}, #{array[1]}"
    self[:coordinates] = [array[2].split(", ")[1].gsub(")","").to_f, array[2].split(", ")[0].gsub("(","").to_f]
  end

end
