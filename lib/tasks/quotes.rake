require 'csv'    

namespace :db do
  desc "Fill database with quotes"

  task quote: :environment do
    make_quotes
  end
end


def make_quotes
  filename="/home/christoph/Documenten/kratosproject/quotes/quotes.csv"
  CSV.foreach(filename, :headers => true) do |row|
    Quote.create!(row.to_hash)
  end
end
