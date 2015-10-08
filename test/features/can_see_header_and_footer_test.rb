#TODO enter metadata in the controller
#TODO check titles
#TODO add beta tag and popup
#TODO add working on pages for non finished stuff
#TODO zoek oplossing voor 404 pagina's en dergelijke (via routes)
#TODO placeholder for teams
#TODO placeholder for following
#TODO check twitter following

require "test_helper"

feature "CanSeeHeaderAndFooter" do

  before :each do
    visit root_path
  end

  scenario "can see header and footer on every page" do
    page.has_css?(".header-v6").must_equal true
    page.has_css?(".footer-v2").must_equal true

    visit test_path
    page.has_css?(".header-v6").must_equal true
    page.has_css?(".footer-v2").must_equal true
  end

  scenario "can see logo in header and footer" do
    page.has_css?(".header-v6 #shrink-logo").must_equal true
    page.has_css?(".footer-v2 #logo-footer").must_equal true
  end

  scenario "can see working leaderboard dropdown in header" do
    #TODO add all header translations
    #TODO add leaderboard dropdow
  end

  scenario "can see twitter in the footer" do
    page.has_css?(".footer-v2 .latest-tweets-inner").must_equal true
  end

  scenario "can see breadcrumbs except on homepage" do
    visit root_path
    page.has_css?("ol.breadcrumb").must_equal false

    visit contests_path
    page.has_css?("ol.breadcrumb").must_equal true
  end
end
