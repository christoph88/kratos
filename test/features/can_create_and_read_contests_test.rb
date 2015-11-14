require "test_helper"

feature "CanCreateAndReadContests" do
  scenario "Can create leaderboards after logging in" do
    
    visit root_path
    within ".navbar-nav" do
      click_link "leaderboards"
    end

    page.must_have_content "Show all leaderboards"
    page.has_css?(".grid-boxes-caption").must_equal true
    click_link "new leaderboard."

    within ".reg-page" do
      fill_in "user[login]", with: "chris88"
      fill_in "user[password]", with:"testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Create"

    within ".reg-page" do
      fill_in "contest[name]", with: "createreadcontest"
      fill_in "contest[description]", with:"testdescription"
      find('input[name="commit"]').click
    end

    page.must_have_content "createreadcontest"
    
    visit contests_path
    page.must_have_content "createreadcontest"

    #save_and_open_page

  end
end
