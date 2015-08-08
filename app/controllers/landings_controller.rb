class LandingsController < ApplicationController
  def index
    @title = t('landings.index.title')
    set_meta_tags keywords:     %w[leaderboards contests weightlifting powerlifting strongman compete ranking],
                  description:  "This is the kratos homepage."
  end

  def test
    @title = t('landings.test.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""
  end
end
