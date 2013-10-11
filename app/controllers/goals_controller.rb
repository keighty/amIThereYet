class GoalsController < ApplicationController
  before_action :set_user, only: [:create, :update, :edit]

  def edit

    @goal = @user.goals.find(params[:id])
    render partial: 'editgoal'
  end

  def show
  end

  def create
    @goal = @user.goals.create!(goal_params)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'New goal created' }
      format.js
    end
  end

  def update

  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def goal_params
      params.require(:goal).permit(:description, :motivation)
    end
end
