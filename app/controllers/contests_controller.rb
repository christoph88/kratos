class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  before_action :breadcrumb_base
  before_action :breadcrumb_contest, only: [:show, :edit, :update, :destroy]

  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @title = t('contests.index.title')
    set_meta_tags keywords:     %w[leaderboard contest win],
                  description:  "View all the #{Settings.appname} leaderboards now!"

    @contests = Contest.all
    respond_with(@contests)
  end

  def show
    add_breadcrumb t('contests.show.breadcrumb', default: "show"), contest_path(@contest)
    @title = t('contests.show.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    respond_with(@contest)
  end

  def new
    add_breadcrumb t('landings.new.breadcrumb', default: "new leaderboard"), new_contest_path
    @title = t('contests.new.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new
    respond_with(@contest)
  end

  def edit
    add_breadcrumb t('contests.edit.breadcrumb', default: "edit"), edit_contest_path(@contest)
    @title = t('contests.edit.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

  end

  def create
    add_breadcrumb t('landings.create.breadcrumb', default: "create leaderboard"), new_contest_path
    @title = t('contests.create.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new(contest_params)
    @contest.admin_id = current_user.id
    @contest.save
    respond_with(@contest)
  end

  def update
    add_breadcrumb t('contests.update.breadcrumb', default: "update"), edit_contest_path(@contest)
    @title = t('contests.update.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest.update(contest_params)
    respond_with(@contest)
  end

  def destroy
    add_breadcrumb t('contests.destroy.breadcrumb', default: "delete"), edit_contest_path(@contest)
    @title = t('contests.destroy.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest.destroy
    respond_with(@contest)
  end

  private
    def set_contest
      @contest = Contest.find(params[:id])
    end

    def contest_params
      params.require(:contest).permit(:name, :description)
    end

    def correct_user
      @contest = current_user.contests.find_by(id: params[:id])
      redirect_to contests_path, notice: t('controller.correct_user') if @contest.nil?
    end

    def breadcrumb_base
      add_breadcrumb t('landings.index.breadcrumb', default: "home"), root_path
      add_breadcrumb t('contests.index.breadcrumb', default: "leaderboards"), contests_path
    end

    def breadcrumb_contest
      add_breadcrumb @contest.name, contest_path(@contest)
    end

end

