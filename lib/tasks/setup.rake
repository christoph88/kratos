require 'csv'    

namespace :db do
  desc "Setup database with app specific values."

  task asetup: :environment do
    make_quotes
    make_ctypes
  end

  task aquote: :environment do
    make_quotes
  end

  task actype: :environment do
    make_ctypes
  end
end


def make_quotes
  #delete all current records
  Quote.delete_all

  #download quotes from google drive file
  uri = URI.parse(Settings.quotes_csv)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)

  begin
    #place quotes in a tempfile
    tempfile = Tempfile.new('quotes.csv')
    File.open(tempfile.path,'wb') do |f|
      f.write response.body
    end

    #open tempfile and load into proper table
    filename = tempfile.path
    CSV.foreach(filename, :headers => true) do |row|
      Quote.create!(row.to_hash)
    end
  ensure
    # close and delete tempfile as good practice
    tempfile.close
    tempfile.unlink
  end

end

def make_ctypes
  #delete all current records
  Ctype.delete_all

  #download quotes from google drive file
  uri = URI.parse(Settings.ctypes_csv)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)

  begin
    #place quotes in a tempfile
    tempfile = Tempfile.new('ctype.csv')
    File.open(tempfile.path,'wb') do |f|
      f.write response.body
    end

    #open tempfile and load into proper table
    filename = tempfile.path
    CSV.foreach(filename, :headers => true) do |row|
      Ctype.create!(row.to_hash)
    end
  ensure
    # close and delete tempfile as good practice
    tempfile.close
    tempfile.unlink
  end
end
