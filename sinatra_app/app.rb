require "sinatra"
require "active_record"
require "mysql2"

ActiveRecord::Base.configurations = YAML.load_file("database.yml")
ActiveRecord::Base.establish_connection(:development)

class Task < ActiveRecord::Base; end

set :server, :puma

get "/users/:user_id/tasks" do
  tasks = Task.where(user_id: params[:user_id])
  {
    total_count: tasks.count,
    tasks: tasks.map do |task|
      {
        id: task.id,
        title: task.title,
        category_id: task.category_id
      }
    end
  }.to_json
end


