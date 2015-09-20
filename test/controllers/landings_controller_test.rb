require 'test_helper'

class LandingsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
    get :test
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end
end
