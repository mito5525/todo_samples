module Api::Views::Tasks
  class Index
    include Api::View

    def render
      raw(JSON.generate(body))
    end

    private

    def body
      {
        total_count: tasks.count,
        tasks: tasks.map do |task|
          {
            id: task.id,
            title: task.title,
            category_id: task.category_id
          }
        end
      }
    end
  end
end
