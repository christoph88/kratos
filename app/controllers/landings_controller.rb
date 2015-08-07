class LandingsController < ApplicationController
  def index
    @title = t('landings.index.title')
  end

  def test
    @title = t('landings.test.title')
  end
end
