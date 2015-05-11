require 'rails_helper'

RSpec.describe "contests/edit", type: :view do
  before(:each) do
    @contest = assign(:contest, Contest.create!(
      :name => "MyString",
      :description => "MyText",
      :submission_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit contest form" do
    render

    assert_select "form[action=?][method=?]", contest_path(@contest), "post" do

      assert_select "input#contest_name[name=?]", "contest[name]"

      assert_select "textarea#contest_description[name=?]", "contest[description]"

      assert_select "input#contest_submission_id[name=?]", "contest[submission_id]"

      assert_select "input#contest_user_id[name=?]", "contest[user_id]"
    end
  end
end
