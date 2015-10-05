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
  scenario "can see header and footer on every page" do
  end

  scenario "can see logo in header and footer" do
  end

  scenario "can see header content" do
    #TODO add translations
  end

  scenario "can see footer content" do
    #TODO add translations
  end

  scenario "can see breadcrumbs except on homepage" do
    visit root_path
    page.has_css?("ol.breadcrumb").must_equal false

    visit contests_path
    page.has_css?("ol.breadcrumb").must_equal true
  end
end
