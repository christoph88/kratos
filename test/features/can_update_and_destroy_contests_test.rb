require "test_helper"

feature "CanUpdateAndDestroyContests" do
  scenario "Can update or destroy leaderboards after logging in" do

    #first login because edit contest relies on current_user

    visit new_user_session_path

    within ".reg-page" do
      fill_in "user[login]", with: "chris88"
      fill_in "user[password]", with:"testtest"
      find('input[name="commit"]').click
    end

    #proceed to root to start testing properly
    
    visit root_path

    within ".navbar-nav" do
      click_link "leaderboards"
    end

    page.must_have_content "Show all leaderboards"

    page.has_css?(".grid-boxes-caption").must_equal true
    
    # placeholder only on pages without any submissions

    click_link "contest"
    save_and_open_page
    page.has_css? ".placeholder"

    # look for contests with submissions
    visit contests_path

    click_link "contestsuperior"

    click_link "Edit this contest"

    page.must_have_content "Edit leaderboard"

    within ".reg-page" do
      fill_in "contest[name]", with: "editcontest"
      fill_in "contest[description]", with:"testdescription"
      find('input[name="commit"]').click
    end

    page.must_have_content "editcontest"

    visit contests_path
    page.must_have_content "editcontest"

    #save_and_open_page

  end
end
