require_relative "../../app/models/company"

module CsvImporter

  def import(file)
    CSV.foreach(file, headers: true) do |row|
      Company.find_or_create_by( name:   row["Name"],
                                 symbol: row["Symbol"] )
    end
  end

end