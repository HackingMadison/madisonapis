require 'csv'

class MadisonApi
  include Mongoid::Document

  def self.source
    HTTParty.get(url)
  end

  def self.csv
    CSV.parse(source, :headers => true)
  end

  def self.import_from_source
    csv.each do |row|
      record = self.where(ward: row['Ward']).first_or_initialize
      row.to_hash.keys.each do |key|
        if !skip_fields.include?(key)
          if record.respond_to?(key.parameterize.underscore+"=")
            record.send(key.parameterize.underscore+"=",row.to_hash[key])
          else
            record[key.parameterize.underscore] = convert_value(row.to_hash[key])
          end
        end
      end
      record.save!
    end
  end

  def self.skip_fields
    []
  end

  def self.convert_value(value)
    case
    when value == "true"
      true
    when value == "false" || value.nil?
      false
    else
      value
    end
  end

end