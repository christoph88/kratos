require "test_helper"

describe Contest do
  let(:invalid) { Contest.new }
  let(:default) { contests :default }

  it "must be valid" do
    value(default).must_be :valid?
  end

  it "must be invalid" do
    value(invalid).wont_be :valid?
  end

  it "must have tonnage" do
    default.tonnage.must_equal 440
  end

  it "must have contest type translations" do
    default.ctype.name.must_equal "weight x reps"
  end

  it "must have contest short description translations" do
    default.ctype.desc.must_equal "Total tonnage is calculated by multiplying weight x reps, the one with the highest tonnage wins." 
  end

end
