class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    add_breadcrumb "leaderboards", contests_path
    @title = t('contests.index.title')
    set_meta_tags keywords:     %w[leaderboard contest win],
                  description:  "View all the #{Settings.appname} leaderboards now!"

    @contests = Contest.all
    respond_with(@contests)
  end

  def show
    @title = t('contests.show.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    respond_with(@contest)
  end

  def new
    @title = t('contests.new.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new
    respond_with(@contest)
  end

  def edit
    @title = t('contests.edit.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

  end

  def create
    @title = t('contests.create.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new(contest_params)
    @contest.admin_id = current_user.id
    @contest.save
    respond_with(@contest)
  end

  def update
    @title = t('contests.update.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest.update(contest_params)
    respond_with(@contest)
  end

  def destroy
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
end
