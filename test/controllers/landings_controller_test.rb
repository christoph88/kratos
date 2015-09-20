require 'test_helper'

class LandingsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get test" do
    get :test
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
