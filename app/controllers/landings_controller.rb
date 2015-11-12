class LandingsController < ApplicationController
  before_action :breadcrumb_base, only: [:index, :test]

  def robots
    filename = Rails.env.production? ? 'production' : 'development'
    robots = File.read(Rails.root + "config/robots/#{filename}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

  def index
    @title = t('.title')
    set_meta_tags keywords:     %w[leaderboards contests weightlifting powerlifting strongman compete ranking],
                  description:  "This is the kratos homepage."
  end

  def test
    add_breadcrumb t('.breadcrumb'), test_path
    @title = t('landings.test.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    uri = URI.parse(Settings.quotes_csv)
    uri = URI.parse(Settings.ctypes_csv)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    tempquotes = Tempfile.new('quotes.csv')
    File.open(tempquotes.path,'wb') do |f|
      f.write response.body
    end
    @data = File.read(tempquotes.path)

  end

  private

  def breadcrumb_base
    add_breadcrumb t('landings.index.breadcrumb'), root_path
  end
end
