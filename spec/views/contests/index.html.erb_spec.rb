require 'rails_helper'

RSpec.describe "contests/index", type: :view do
  before(:each) do
    assign(:contests, [
      Contest.create!(
        :name => "Name",
        :description => "MyText",
        :submission_id => 1,
        :user_id => 2
      ),
      Contest.create!(
        :name => "Name",
        :description => "MyText",
        :submission_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of contests" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
