class ContestsController < ApplicationController
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_contest, only: [:show, :edit, :update, :destroy]
  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :breadcrumb_base
  before_action :breadcrumb_contest, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @title = t('.title')
    set_meta_tags keywords:     %w[leaderboard contest win],
                  description:  "View all the #{Settings.appname} leaderboards now!"

    @quotes = Quote.all

    @contests = Contest.all.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
    respond_with(@contests)

  end

  def show
    add_breadcrumb t('.breadcrumb'), contest_submissions_path(@contest)
    @title = t('.title', contest: @contest.name)
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    respond_with(@contest)
  end

  def new
    add_breadcrumb t('.breadcrumb'), new_contest_path
    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new
    respond_with(@contest)
  end

  def edit
    add_breadcrumb t('.breadcrumb'), contest_path(@contest)
    @title = t('.title', contest: @contest.name)
    #set_meta_tags keywords:     %w[],
                  #description:  ""

  end

  def create
    add_breadcrumb t('.breadcrumb'), new_contest_path
    @title = t('.title')
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest = current_user.contests.new(contest_params)
    @contest.admin_id = current_user.id
    @contest.save
    redirect_to contest_submissions_path(@contest)
  end

  def update
    add_breadcrumb t('.breadcrumb'), contest_path(@contest)
    @title = t('.title', contest: @contest.name)
    #set_meta_tags keywords:     %w[],
                  #description:  ""

    @contest.update(contest_params)
    redirect_to contest_submissions_path(@contest)
  end

  def destroy
    add_breadcrumb t('.breadcrumb'), edit_contest_path(@contest)
    @title = t('.title', contest: @contest.name)
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
      params.require(:contest).permit(:name, :description, :avatar, :ctype_id)
    end

    def correct_user
      @contest = Contest.find_by(id: params[:id])
      redirect_to contests_path, notice: t('controller.correct_user') unless @contest.admin == current_user
    end

    def breadcrumb_base
      add_breadcrumb t('landings.index.breadcrumb'), root_path
      add_breadcrumb t('contests.index.breadcrumb'), contests_path
    end

    def breadcrumb_contest
      add_breadcrumb @contest.name, contest_path(@contest)
    end

end

