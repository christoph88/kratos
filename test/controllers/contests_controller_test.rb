require "test_helper"

describe ContestsController do
  let(:user) { users :default }
  let(:contest) { contests :default }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:contests)).wont_be :nil?
  end

  describe "gets new" do
    it "redirects to login_path" do
      session[:user_id] = nil
      get :new
      assert_redirected_to new_user_session_path
    end

    it "requires authentication" do
      sign_in users :default
      get :new
      value(response).must_be :success?
    end
  end

  it "creates contest" do
    sign_in users :default
    expect {
      post :create, contest: { name: "test", admin_id: 1  }
    }.must_change "Contest.count"

    must_redirect_to contest_path(assigns(:contest))
  end

  it "shows contest" do
    get :show, id: contest
    value(response).must_be :success?
  end

  it "gets edit" do
    sign_in users :default
    get :edit, id: contest
    value(response).must_be :success?
  end

  it "updates contest" do
    sign_in users :default
    put :update, id: contest, contest: { name: "bier" }
    must_redirect_to contest_path(assigns(:contest))
  end

  it "destroys contest" do
    sign_in users :default
    expect {
      delete :destroy, id: contest
    }.must_change "Contest.count", -1

    must_redirect_to contests_path
  end

end
