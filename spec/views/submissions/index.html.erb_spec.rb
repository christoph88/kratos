require 'rails_helper'

RSpec.describe "submissions/index", type: :view do
  before(:each) do
    assign(:submissions, [
      Submission.create!(
        :reps => 1,
        :weight => "9.99",
        :user_id => 2
      ),
      Submission.create!(
        :reps => 1,
        :weight => "9.99",
        :user_id => 2
      )
    ])
  end

  it "renders a list of submissions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
