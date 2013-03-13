class Park
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :acreage, type: Float
  field :source_id, type: Integer
  field :coordinates, type: Array
  field :address

  reverse_geocoded_by :coordinates

  def self.url
    'https://data.cityofmadison.com/api/views/svr6-6gvb/rows.csv?accessType=DOWNLOAD'
  end

  def self.import_from_source
    csv.each do |row|
      park = Park.where(source_id: row['Id']).first_or_initialize
      row.to_hash.keys.each do |key|
        if !skip_fields.include?(key)
          if park.respond_to?(key.parameterize.underscore+"=")
            park.send(key.parameterize.underscore+"=",row.to_hash[key])
          else
            park[key.parameterize.underscore] = convert_value(row.to_hash[key])
          end
        end
      end
      park.save!
    end
  end

  def self.skip_fields
    ["Id"]
  end

  def location=(string)
    self.coordinates = [string.split(", ")[1].gsub(")","").to_f, string.split(", ")[0].gsub("(","").to_f]
  end

end
