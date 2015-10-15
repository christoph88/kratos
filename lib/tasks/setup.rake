require 'csv'    

namespace :db do
  desc "Fill database with quotes"

  task quote: :environment do
    make_quotes
  end
  task contest_type: :environment do
    make_contest_types
  end
end


def make_quotes
  #delete all current records
  Quote.delete_all

  #reload all records from csv file
  #quotes are place automatically, raw output is used
  filename= Settings.quotes_csv
  CSV.foreach(filename, :headers => true) do |row|
    Quote.create!(row.to_hash)
  end
end

def make_contest_types
  #delete all current records
  Contest_type.delete_all

  #reload all records from csv file
  #quotes are place automatically, raw output is used
  filename= Settings.contest_types_csv
  CSV.foreach(filename, :headers => true) do |row|
    Contest_type.create!(row.to_hash)
  end
end
