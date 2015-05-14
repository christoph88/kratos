class LandingsController < ApplicationController
  layout 'landingpage', only: :landingpage

  def landingpage
    @page = t('landings.landingpage.title')
  end

  def test
    @page = t('landings.test.title')
  end
end
