class PollingPlace < MadisonApi
  include Mongoid::Document

  field :ward, type: Integer
  field :aldermanic_district, type: Integer

  def self.url
    'https://data.cityofmadison.com/api/views/rtyh-6ucr/rows.csv?accessType=DOWNLOAD'
  end

  def self.import_from_source
    csv.each do |row|
      pollingplace = PollingPlace.where(ward: row['Ward']).first_or_initialize
      row.to_hash.keys.each do |key|
        if !skip_fields.include?(key)
          if pollingplace.respond_to?(key.parameterize.underscore+"=")
            pollingplace.send(key.parameterize.underscore+"=",row.to_hash[key])
          else
            pollingplace[key.parameterize.underscore] = convert_value(row.to_hash[key])
          end
        end
      end
      pollingplace.save!
    end
  end

end
