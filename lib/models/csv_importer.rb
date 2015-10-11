module CsvImporter

  def import(file)
    CSV.foreach(file, headers: true) do |row|
      puts row["Symbol"] + ":" + row["Name"]
    end
  end

end