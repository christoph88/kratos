require "test_helper"

feature "CanRegisterUsers" do
  scenario "Can register users" do
    visit root_path
    within ".navbar-nav" do
      click_link "profile"
    end
    page.must_have_content "Sign up"

    within ".reg-page" do
      fill_in "user[username]", with: "test@test.be"
      fill_in "user[email]", with: "test@test.be"
      fill_in "user[password]", with: "testtest"
      fill_in "user[password_confirmation]", with: "testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Welcome! You have signed up successfully."

  end

  scenario "Can register users on login page" do
    visit new_user_session_path
    page.must_have_content "Login"

    click_link "create one."

    within ".reg-page" do
      fill_in "user[username]", with: "test@test.be"
      fill_in "user[email]", with: "test@test.be"
      fill_in "user[password]", with: "testtest"
      fill_in "user[password_confirmation]", with: "testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Welcome! You have signed up successfully."

  end
end
