require 'csv'

class TabParser
  def initialize(attributes={})
    @import_file = attributes[:import_file]
  end

  def rows
    CSV.parse(@import_file, col_sep: "\t", headers: true)
  end
  
  def import_type
    "Tab"
  end
end