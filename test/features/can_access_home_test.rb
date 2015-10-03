require "test_helper"

#TODO add breadcrumbs to controller

feature "CanAccessHome" do

  before :each do
    visit root_path
  end

  scenario "Has a working robots.txt" do
    visit "/robots.txt"
    page.must_have_content "Disallow"
  end

  scenario "Has devhelp" do
    page.has_css?("#devhelp").must_equal false

    visit "test"
    page.has_css?("#devhelp").must_equal false
  end

  scenario "Has Google tagmanager installed" do
    #TODO find how to fix this
  end

  scenario "Has no breadcrumbs on homepage" do
    page.has_css?(".breadcrumbs").must_equal false

    visit "test"
    page.has_css?(".breadcrumbs").must_equal true
  end

  scenario "Has branding" do
    page.must_have_content "Kratos"
    page.find(".navbar-brand")
  end

  scenario "Has a header and a footer" do
    page.has_css?(".header-v6").must_equal true
    page.has_css?(".footer-v2").must_equal true
  end
end
