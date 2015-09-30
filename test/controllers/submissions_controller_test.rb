require "test_helper"

describe SubmissionsController do
  let(:submission) { submissions :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:submissions)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates submission" do
    expect {
      post :create, submission: {  }
    }.must_change "Submission.count"

    must_redirect_to submission_path(assigns(:submission))
  end

  it "shows submission" do
    get :show, id: submission
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: submission
    value(response).must_be :success?
  end

  it "updates submission" do
    put :update, id: submission, submission: {  }
    must_redirect_to submission_path(assigns(:submission))
  end

  it "destroys submission" do
    expect {
      delete :destroy, id: submission
    }.must_change "Submission.count", -1

    must_redirect_to submissions_path
  end
end
