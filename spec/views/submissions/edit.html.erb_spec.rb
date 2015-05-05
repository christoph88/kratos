require 'rails_helper'

RSpec.describe "submissions/edit", type: :view do
  before(:each) do
    @submission = assign(:submission, Submission.create!(
      :reps => 1,
      :weight => "9.99",
      :user_id => 1
    ))
  end

  it "renders the edit submission form" do
    render

    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do

      assert_select "input#submission_reps[name=?]", "submission[reps]"

      assert_select "input#submission_weight[name=?]", "submission[weight]"

      assert_select "input#submission_user_id[name=?]", "submission[user_id]"
    end
  end
end
