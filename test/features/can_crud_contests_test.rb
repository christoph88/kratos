require "test_helper"
    #TODO add translations for all the pages
    #index
    #new
    #show
    #edit
    #form
    #TODO add design for all the pages
    #index
    #new
    #show
    #edit
    #form

feature "CanCrudContests" do
  scenario "can create a contest" do
    #TODO can create different contests
  end
  
  scenario "can view a contest" do
    #TODO do not load all contests at once, look at documentation for bulk load
    #TODO can see a custom contest summary
    #TODO can see a contest image
  end
  
  scenario "should be able to use pagination" do
    #TODO implement
  end
  
  scenario "can search for a contest" do
    #TODO implement
  end
  
  scenario "can see weightlifting quotes" do
    #TODO create quote db
    #TODO randomly load quotes
  end

  scenario "can update a contest" do
    #TODO implement
  end
  
  scenario "can destroy a contest" do
    #TODO implement
  end
end
