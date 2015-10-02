require "test_helper"

feature "CanCrudSubmissions" do
  scenario "can create a submission" do
    #TODO find how to validate a partial
    #TODO add fields based on the type of contest
    #TODO add option to submit in kg or in pounds
    #TODO test different contest types
    #TODO convert kg to pounds when submittion (when needed)
    #TODO add translations
  end
  
  scenario "can view a submission" do
    #TODO add translations
  end
  
  scenario "should be able to use pagination" do
    #TODO add translations
  end
  
  scenario "should see contest stats" do
    #TODO add translations
  end
  
  scenario "can update a submission" do
    #TODO you cannot update submissions, you destroy them on that view
    #TODO add translations
  end
  
  scenario "can destroy a submission" do
    #TODO add option to delete latest submission
    #TODO add translations
  end
end

