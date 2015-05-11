require 'rails_helper'

RSpec.describe "contests/new", type: :view do
  before(:each) do
    assign(:contest, Contest.new(
      :name => "MyString",
      :description => "MyText",
      :submission_id => 1,
      :user_id => 1
    ))
  end

  it "renders new contest form" do
    render

    assert_select "form[action=?][method=?]", contests_path, "post" do

      assert_select "input#contest_name[name=?]", "contest[name]"

      assert_select "textarea#contest_description[name=?]", "contest[description]"

      assert_select "input#contest_submission_id[name=?]", "contest[submission_id]"

      assert_select "input#contest_user_id[name=?]", "contest[user_id]"
    end
  end
end
