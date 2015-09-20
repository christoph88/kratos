require "test_helper"

feature "CanAccessHome" do

  scenario "Has a working robots.txt" do
    visit "/robots.txt"
    page.must_have_content "Disallow"
  end

  scenario "Has Google tagmanager installed" do
  end

  scenario "Has branding" do
    visit root_path
    page.must_have_content "Kratos"
    page.find(".navbar-brand")
  end

  scenario "Has a header and a footer" do
    visit root_path
    page.has_css?(".header-v6").must_equal true
    page.has_css?(".footer-v2").must_equal true
  end

  scenario "Has correct header links" do
  end

  scenario "Has correct footer links" do
  end

  scenario "Has twitter in the footer" do
  end

  scenario "Has a dynamic menu" do
  end

end
