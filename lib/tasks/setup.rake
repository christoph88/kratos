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
  Ctype.delete_all

  #reload all records from csv file
  #quotes are place automatically, raw output is used
  filename= Settings.ctypes_csv
  CSV.foreach(filename, :headers => true) do |row|
    Ctype.create!(row.to_hash)
  end
end
