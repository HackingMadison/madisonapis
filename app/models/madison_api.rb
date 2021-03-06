require 'csv'

class MadisonApi
  include Mongoid::Document

  class_attribute :url
  class_attribute :source_key
  class_attribute :key

  def self.source
    HTTParty.get(url)
  end

  def self.reimport
    delete_all
    import
  end

  def self.csv
    @csv ||= CSV.parse(source, :headers => true)
  end

  def self.import
    rows = csv
    if Rails.env.development?
      rows = rows.take(500)
      puts("Only importing 500 records in dev environment")
    end
    rows.each do |row|
      query = Hash.new
      query[key || source_key.parameterize.underscore] = row[source_key]
      record = self.where(query).first_or_initialize
      row.to_hash.keys.each do |key|
        if !skip_fields.include?(key) || key != source_key
          if record.respond_to?(key.parameterize.underscore+"=")
            record.send(key.parameterize.underscore+"=",row.to_hash[key].try(:strip))
          else
            record[key.parameterize.underscore] = convert_value(row.to_hash[key].try(:strip))
          end
        end
      end
      record.save!
    end
    return count
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