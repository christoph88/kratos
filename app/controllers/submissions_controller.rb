class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html

  def index
    @title = t('submissions.index.title')

    @submissions = Submission.all
    respond_with(@submissions)
  end

  def show
    @title = t('submissions.show.title')

    respond_with(@submission)
  end

  def new
    @title = t('submissions.new.title')

    @submission = Submission.new
    respond_with(@submission)
  end

  def edit
    @title = t('submissions.edit.title')

  end

  def create
    @title = t('submissions.create.title')

    @submission = Submission.new(submission_params)
    @submission.save
    respond_with(@submission)
  end

  def update
    @title = t('submissions.update.title')

    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    @title = t('submissions.destroy.title')

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
      @submission = current_user.submissions.find_by(id: params[:id])
      redirect_to submissions_path, notice: t('submissions.controller.correct_user') if @submission.nil?
    end

end
