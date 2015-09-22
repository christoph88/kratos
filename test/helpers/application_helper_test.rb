require "test_helper"
include Devise::TestHelpers

describe ApplicationHelper do
  def current_user
      users :default
  end

  it "should show base title if none" do
    title.must_equal t("general.base_title")
  end
  
  it "should show proper title if present" do
    @title = "this is a title."
    title.must_equal "this is a title."
  end

  it "should show base pagetitle if none" do
    pagetitle.must_equal t("general.newpage_title")
  end
  
  it "should show proper pagetitle if present" do
    @title = "this is a pagetitle."
    pagetitle.must_equal "this is a pagetitle."
  end

  it "should show kg metric" do
    metric.must_equal " " + t("general.kg", default: "kg")
  end

  it "should show lbs metric" do
    current_user.kg = false
    metric.must_equal " " + t("general.lbs", default: "lbs")
  end
end
