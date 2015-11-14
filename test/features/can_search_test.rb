require "test_helper"

feature "CanSearch" do
  scenario "can search for contests" do
    # do a failed search
    visit root_path

    within ".navbar-nav" do
      click_link "leaderboards"
    end

    within ".input-group" do
      fill_in "search", with: "testsearch"
      find(".btn-u").click
    end

    page.must_have_content "No leaderboards found,"

    # do a working search
    visit contests_path

    within ".input-group" do
      fill_in "search", with: "forcontestx"
      find(".btn-u").click
    end

    page.must_have_content "searchforcontestx"
    #save_and_open_page
  end
end
