class GoalsController < ApplicationController

  def show
  end

  def create
    @user = User.find(params[:user_id])
    @goal = @user.goals.create!(goal_params)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'New goal created' }
      format.js
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :motivation)
    end
end
