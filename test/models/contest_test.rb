require "test_helper"

describe Contest do
  let(:contest) { Contest.create(name: "test",
                                 admin_id: 1,) }
  let(:invalid) { Contest.new }

  it "must be valid" do
    value(contest).must_be :valid?
  end

  it "must be invalid" do
    value(invalid).wont_be :valid?
  end

  it "must have tonnage" do
    contests(:one).tonnage.must_equal 440
  end
end
