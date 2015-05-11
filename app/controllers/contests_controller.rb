class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

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
end
