class GoalsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]

	def index
		@goals = Goal.all
	end

	def show
		@goal = Goal.find params[:id]
	end

	def new
		@goal = Goal.new
	end

	def create
		@goal = Goal.new safe_goal_params
		@goal.user = current_user
		if @goal.save
			redirect_to @goal
		else
			render :new
		end
	end

	private

	def safe_goal_params
		params.require(:goal).permit(:title, :summary)
	end


end

