require "test_helper"

describe SubmissionsController do
  let(:user) { users :default }
  let(:contest) { contests :default }
  let(:submission) { submissions :default }

  describe "gets index" do
    it "should be accessible to anonymous users" do
      get :index, contest_id: contest
      value(response).must_be :success?
      value(assigns(:submissions)).wont_be :nil?
    end

    it "should show user kg preferences" do
      sign_in users :default
      get :index, contest_id: contest
      submission.converted_weight(user).must_equal 22.0462262.round(2)
      value(response).must_be :success?
      value(assigns(:submissions)).wont_be :nil?
    end
  end

  it "gets new" do
    sign_in users :default
    get :new, contest_id: contest
    value(response).must_be :success?
  end

  it "creates submission" do
    sign_in users :default
    expect {
      post :create, contest_id: contest, submission: { user_id: 1, reps: 1, weight: 1 }
    }.must_change "Submission.count"

    must_redirect_to contest_submissions_path(assigns(:contest))
  end

  it "shows submission" do
    get :show, id: submission
    value(response).must_be :success?
  end

  it "gets edit" do
    sign_in users :default
    get :edit, contest_id: contest, id: submission
    value(response).must_be :success?
  end

  it "updates submission" do
    sign_in users :default
    put :update, id: submission, submission: { user_id: 1, reps: 1, weight: 1  }
    must_redirect_to submission_path(assigns(:submission))
  end

  it "destroys submission" do
    #skip("figure out how to destroy")
    sign_in users :default
    expect {
      delete :destroy, contest_id: contest, id: submission
    }.must_change "Submission.count", -1

    must_redirect_to contest_submissions_path(assigns(:contest))
  end
end
