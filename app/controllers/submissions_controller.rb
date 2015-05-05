class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html

  def index
    @submissions = Submission.all
    respond_with(@submissions)
  end

  def show
    respond_with(@submission)
  end

  def new
    @submission = Submission.new
    respond_with(@submission)
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.save
    respond_with(@submission)
  end

  def update
    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    @submission.destroy
    respond_with(@submission)
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:reps, :weight, :user_id)
    end

    def correct_user
      @pin = current_user.submissions.find_by(id: params[:id])
      redirect_to submissions_path, notice: t('controller.correct_user') if @pin.nil?
    end

end
