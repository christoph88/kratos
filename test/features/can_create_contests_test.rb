require "test_helper"

feature "CanCreateContests" do
  scenario "Can create leaderboards after logging in" do
    
    visit new_user_session_path
    page.must_have_content "Login to your account"

    within ".reg-page" do
      fill_in "user[login]", with: "chris88"
      fill_in "user[password]", with:"testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Create"
    save_and_open_page

  end
end
