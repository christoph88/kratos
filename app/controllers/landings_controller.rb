class LandingsController < ApplicationController
  layout 'landingpage', only: :landingpage

  def landingpage
    @title = t('landings.landingpage.title')
  end

  def test
    @title = t('landings.test.title')
  end
end
