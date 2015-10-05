class LandingsController < ApplicationController
  before_action :breadcrumb_base, only: [:index, :test]

  def robots
    filename = Rails.env.production? ? 'production' : 'development'
    robots = File.read(Rails.root + "config/robots/#{filename}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

  def index
    @title = t('landings.index.title')
    set_meta_tags keywords:     %w[leaderboards contests weightlifting powerlifting strongman compete ranking],
                  description:  "This is the kratos homepage."
  end

  def test
    add_breadcrumb t('landings.test.breadcrumb', default: "testpage"), test_path
    @title = t('landings.test.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""
  end

  private

  def breadcrumb_base
    add_breadcrumb t('landings.index.breadcrumb', default: "home"), root_path
  end
end
