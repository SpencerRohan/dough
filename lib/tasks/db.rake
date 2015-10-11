namespace :db do
  desc "Import csv files located in db/csv pipeline"
  task import: :environment do
    require_relative '../models/csv_importer.rb'
    include CsvImporter

    path = File.expand_path('../../..', __FILE__) + '/db/csv/*'
    file = Dir[path]
    CsvImporter::import(file)
  end

end
