class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(permit_params)
    if @task.save
      respond_to do |format|
        format.js {}
      end
    end
  end

  private
  def permit_params
    params.require(:task).permit(:title, :description, :urgency)
  end

end