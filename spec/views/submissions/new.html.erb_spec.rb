require 'rails_helper'

RSpec.describe "submissions/new", type: :view do
  before(:each) do
    assign(:submission, Submission.new(
      :reps => 1,
      :weight => "9.99",
      :user_id => 1
    ))
  end

  it "renders new submission form" do
    render

    assert_select "form[action=?][method=?]", submissions_path, "post" do

      assert_select "input#submission_reps[name=?]", "submission[reps]"

      assert_select "input#submission_weight[name=?]", "submission[weight]"

      assert_select "input#submission_user_id[name=?]", "submission[user_id]"
    end
  end
end
