require "test_helper"

describe LandingsController do

  # sign out user to prevent devise authentication error
  before :each do
    sign_out :user
  end

  it "generate robots.txt" do
    get :robots

    must_respond_with :success
  end

  it "get index" do
    get :index

    must_respond_with :success
    must_render_template :index
  end

  it "get test" do
    get :test

    must_respond_with :success
    must_render_template :test
  end

end
