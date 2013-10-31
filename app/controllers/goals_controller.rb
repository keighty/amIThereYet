class GoalsController < ApplicationController
  before_action :set_user, only: [:create, :update, :edit, :show, :destroy]
  before_action :set_goal, only: [:update, :edit, :show, :destroy]

  def index
    @goals = set_user.goals
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def edit
    # render partial: 'editgoal'
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def create
    @goal = @user.goals.new(goal_params)
    @goal.total_hours = 0
    @goal.save!

    respond_to do |format|
      format.html { redirect_to @user, notice: 'New goal created' }
      format.js
    end
  end

  def update
    store_location
    if @goal.update(goal_params)
      respond_to do |format|
        flash[:success] = "Goal Updated"
        format.html { redirect_to edit_user_path(@user) }
        format.js
      end
    else
      flash[:error] = "Goal Not Updated"
      redirect_to edit_user_path(@user)
    end
  end

  # DELETE /users/1/goals/1
  def destroy
    if @goal.destroy
      flash[:error] = "Goal removed."
      respond_to do |format|
        format.html {redirect_to @user}
        format.js
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_goal
      @goal = @user.goals.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:description, :motivation)
    end
end
