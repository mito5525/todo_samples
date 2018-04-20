class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: params[:user_id]).to_a
    render json: index_body
  end

  private

  def index_body
    {
      total_count: @tasks.count,
      tasks: @tasks.map do |task|
        {
          id: task.id,
          title: task.title,
          category_id: task.category_id
        }
      end
    }
  end
end
