require "test_helper"

feature "CanUpdateAndDestroyContests" do
  scenario "Can update or destory leaderboards after logging in" do
    
    visit root_path
    within ".navbar-nav" do
      click_link "leaderboards"
    end

    page.must_have_content "Show all leaderboards"
    page.has_css?(".grid-boxes-caption").must_equal true
    click_link "contestsuperior"

    find('div.container.content.profile > div > div.col-md-3.md-margin-bottom-40 > p:nth-child(4) > a').click

    within ".reg-page" do
      fill_in "user[login]", with: "chris88"
      fill_in "user[password]", with:"testtest"
      find('input[name="commit"]').click
    end

    page.must_have_content "Edit leaderboard"

    within ".reg-page" do
      fill_in "contest[name]", with: "editcontest"
      fill_in "contest[description]", with:"testdescription"
      find('input[name="commit"]').click
    end

    page.must_have_content "editcontest"
    
    page.wont_have_content ".placeholder"
    #OPTIMIZE must have all translations
    page.wont_have_content "change me"


    visit contests_path
    page.must_have_content "editcontest"

    #save_and_open_page

  end
end
