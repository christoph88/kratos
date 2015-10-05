class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_contest, only: [:index, :new, :create]

  before_action :breadcrumb_base

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html

  def index
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
    add_breadcrumb t('.breadcrumb', default: "show submission"), submission_path(@submission)

    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""
    
    @contest = @submission.contest_id
    respond_with(@submission)
  end

  def new
    add_breadcrumb t('.breadcrumb', default: "new submission"), new_contest_submission_path

    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new
    respond_with(@submission)
  end

  def edit
    add_breadcrumb t('.breadcrumb', default: "edit submission"), edit_submission_path(@submission)

    @title = t('.title')

  end

  def create
    add_breadcrumb t('.breadcrumb', default: "create submission"), new_contest_submission_path

    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission = @contest.submissions.new(submission_params)
    @submission.user_id = current_user.id
    @submission.save
    respond_with(@submission, location: contest_submissions_path(@contest.id))
  end

  def update
    add_breadcrumb t('.breadcrumb', default: "update submission"), edit_submission_path(@submission)

    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @submission.update(submission_params)
    respond_with(@submission)
  end

  def destroy
    add_breadcrumb t('.breadcrumb', default: "delete submission"), edit_submission_path(@submission)

    @title = t('.title')
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
      add_breadcrumb t('landings.index.breadcrumb', default: "home"), root_path
      add_breadcrumb t('contests.index.breadcrumb', default: "leaderboards"), contests_path

      #add contest name
      unless @contest.nil? then
        add_breadcrumb @contest.name, contest_submissions_path(@contest)
      else
        add_breadcrumb @submission.contest.name, contest_submissions_path(@submission.contest.id)
      end
    end

end
