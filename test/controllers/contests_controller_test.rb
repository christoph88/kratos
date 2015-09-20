require "test_helper"

describe ContestsController do
  let(:contest) { contests :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:contests)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates contest" do
    expect {
      post :create, contest: {  }
    }.must_change "Contest.count"

    must_redirect_to contest_path(assigns(:contest))
  end

  it "shows contest" do
    get :show, id: contest
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: contest
    value(response).must_be :success?
  end

  it "updates contest" do
    put :update, id: contest, contest: {  }
    must_redirect_to contest_path(assigns(:contest))
  end

  it "destroys contest" do
    expect {
      delete :destroy, id: contest
    }.must_change "Contest.count", -1

    must_redirect_to contests_path
  end
end
