require "test_helper"

describe Contest do
  let(:contest) { Contest.create(name: "test",
                                 admin_id: 1,
                                 contest_type: 1) }
  let(:invalid) { Contest.new }
  let(:default) { contests :default }

  it "must be valid" do
    value(contest).must_be :valid?
  end

  it "must be invalid" do
    value(invalid).wont_be :valid?
  end

  it "must have tonnage" do
    default.tonnage.must_equal 440
  end

  it "must have contest type translations" do
    contest.contest_type_tr.must_equal "weight x reps"
  end

  it "must have contest short description translations" do
    contest.contest_short_descr.must_equal "Total tonnage is calculated by multiplying weight x reps, the one with the highest tonnage wins." 
  end

end
