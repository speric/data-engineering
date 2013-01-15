class Importer
  attr_reader :imported_records
  
  def initialize(attributes={})
    @import_parser      = attributes[:import_parser]
    @import_record_type = attributes[:import_record_type]
    @imported_records   = Array.new
  end

  def import!
    rows_from_parsed_file.each do |row|
      normalized_record = normalizer_factory.normalize(row)
      if normalized_record.valid?
        normalized_record.save
        @imported_records.push(normalized_record)
      end
    end
  end
  
  private

  def import_factory
    @import_record_type.to_s.classify.constantize
  end
  
  def normalizer_factory
    (@import_record_type.to_s.classify + @import_parser.import_type.to_s.classify + "Normalizer").constantize
  end

  def rows_from_parsed_file
    @import_parser.rows
  end
end