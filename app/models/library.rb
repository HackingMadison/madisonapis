class Library < MadisonApi
  include Mongoid::Document

  self.url = 'https://data.cityofmadison.com/api/views/hb5z-buaz/rows.csv?accessType=DOWNLOAD'
  self.source_key = "Library"

  def location=(string)
    array = string.split("\n")
    self[:address] = "#{array[0]}, #{array[1]}"
    self[:coordinates] = [array[2].split(", ")[1].gsub(")","").to_f, array[2].split(", ")[0].gsub("(","").to_f]
  end

end
