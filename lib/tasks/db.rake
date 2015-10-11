namespace :db do
  desc "Import csv files located in db/csv pipeline"
  task import: :environment do
    require_relative '../models/csv_importer.rb'
    include CsvImporter

    CsvImporter::import
  end

end
