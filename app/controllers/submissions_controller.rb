class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :update, :destroy]
  before_action :set_contest, only: [:index, :new, :create]

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html

  def index
    breadcrumb_base
    add_breadcrumb @contest.name, contest_submissions_path(@contest)

    @title = "#{@contest.contest_type_tr} => #{@contest.name}"
    set_meta_tags keywords:     %w[rankings winners leaderboard],
                  description:  "View the leaderboard of the #{@contest.name} challenge."
    
    @description = @contest.description
    @creator = @contest.admin.username
    @creation_date = @contest.created_at

    @notifications = Submission.find_by_sql([IO.read('app/models/sql/submissions_latest.sql'), @contest.id])

    @submissions = Submission.find_by_sql([IO.read('app/models/sql/submissions_index.sql'), @contest.id])
    @submissions = @submissions.paginate(page: params[:page], per_page: 10)

    # set submission for new submissions
    @submission = @contest.submissions.new

    respond_with(@submissions)
  end

  def show
    breadcrumb_base
    add_breadcrumb t('submissions.show.breadcrumb', default: "show submission"), submission_path(@submission)

    @title = t('submissions.show.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""
    
    @contest = @submission.contest_id
    respond_with(@submission)
  end

  def new
    breadcrumb_base
    add_breadcrumb t('submissions.new.breadcrumb', default: "new submission"), new_contest_submission_path

    @title = t('submissions.new.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new
    respond_with(@submission)
  end

  def edit
    breadcrumb_base
    add_breadcrumb t('submissions.edit.breadcrumb', default: "edit submission"), edit_submission_path(@submission)

    @title = t('submissions.edit.title')

  end

  def create
    breadcrumb_base
    add_breadcrumb t('submissions.create.breadcrumb', default: "create submission"), new_contest_submission_path

    @title = t('submissions.create.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new(submission_params)
    @submission.user_id = current_user.id
    @submission.save
    respond_with(@submission, location: contest_submissions_path(@contest.id))
  end

  def update
    breadcrumb_base
    add_breadcrumb t('submissions.edit.breadcrumb', default: "update submission"), edit_submission_path(@submission)

    @title = t('submissions.update.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    breadcrumb_base
    add_breadcrumb t('submissions.destroy.breadcrumb', default: "delete submission"), edit_submission_path(@submission)

    @title = t('submissions.destroy.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = Contest.find_by_id(@submission.contest_id)
    @submission.destroy
    respond_with(@contest, location: contest_submissions_path(@contest.id))
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

    def breadcrumb_base
      add_breadcrumb "home", root_path
      add_breadcrumb "leaderboards", contests_path
    end

end
