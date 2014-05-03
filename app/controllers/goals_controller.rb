class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.completed = false
    @goal.user_id = current_user.id

    if @goal.save

      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render user_url(current_user)
    end
  end

  def edit
  end

  def update
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = current_user.find_index_goals
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :privacy, :completed)
  end
end
