require "test_helper"

describe Contest do
  let(:contest) { Contest.new }

  it "must be valid" do
    value(contest).must_be :valid?
  end
end
