class TaskpipelinesController < ApplicationController
  def index
    taskpipelines = Taskpipeline.order("created_at DESC")
    render json: taskpipelines
  end

  def create
    taskpipeline = Taskpipeline.create(taskpipeline_param)
    render json: taskpipeline
  end

  def update
    taskpipeline = Taskpipeline.find(params[:id])
    taskpipeline.update(taskpipeline_param)
    render json: taskpipeline
  end

  def destroy
    taskpipeline = Taskpipeline.find(params[:id])
    taskpipeline.destroy
    head :no_content, status: :ok
  end

  private 
  def taskpipeline_param
    params.require(:taskpipeline).permit(:title, :description, :completed)
  end
end
