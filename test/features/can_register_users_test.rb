require "test_helper"

feature "CanRegisterUsers" do
  scenario "Can register users" do
    visit root_path
    within ".navbar-nav" do
      click_link "profile"
    end
    page.must_have_content "Sign up"

    within ".reg-page" do
      #first register this user before it works!
      fill_in "user[username]", with: "test@test.be"
      fill_in "user[email]", with: "test@test.be"
      fill_in "user[password]", with: "testtest"
      fill_in "user[password_confirmation]", with: "testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Welcome! You have signed up successfully."

    save_and_open_page

  end
end
