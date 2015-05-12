class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  # the current user can only edit, update or destroy if the id of the pin matches the id the user is linked with.
  before_action :correct_user, only: [:edit, :update, :destroy]
  # the user has to authenticate for every action except index and show.
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @contests = Contest.all
    respond_with(@contests)
  end

  def show
    respond_with(@contest)
  end

  def new
    @contest = current_user.contests.new
    respond_with(@contest)
  end

  def edit
  end

  def create
    @contest = current_user.contests.new(contest_params)
    @contest.admin_id = current_user.id
    @contest.save
    respond_with(@contest)
  end

  def update
    @contest.update(contest_params)
    respond_with(@contest)
  end

  def destroy
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
