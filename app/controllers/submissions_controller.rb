class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_contest, only: [:index, :new, :create]

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html

  def index
    @title = @contest.name
    set_meta_tags keywords:     %w[rankings winners leaderboard],
                  description:  "View the leaderboard of the #{@contest.name} challenge."

    @submissions = @contest.submissions
    respond_with(@submissions)
  end

  def show
    @title = t('submissions.show.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""
    
    @contest = @submission.contest_id
    respond_with(@submission)
  end

  def new
    @title = t('submissions.new.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new
    respond_with(@submission)
  end

  def edit
    @title = t('submissions.edit.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contestid = @submission.contest

  end

  def create
    @title = t('submissions.create.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new(submission_params)
    @submission.user_id = current_user.id
    @submission.save
    respond_with(@submission, location: contest_submissions_path(@contest.id))
  end

  def update
    @title = t('submissions.update.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    @title = t('submissions.destroy.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = Contest.find_by_id(@submission.contest_id)
    @submission.destroy
    respond_with(@contest)
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def set_contest
      @contest = Contest.find(params[:contest_id])
    end

    def submission_params
      params.require(:submission).permit(:reps, :weight, :user_id)
    end

    def correct_user
      @submission = current_user.submissions.find_by(id: params[:id])
      redirect_to submission_path, notice: t('submissions.controller.correct_user') if @submission.nil?
    end

end
