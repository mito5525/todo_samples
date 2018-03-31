module Api::Controllers::Tasks
  class Index
    include Api::Action

    expose :tasks

    def call(params)
      @tasks = TaskRepository.new.find_by_user(params[:user_id]).to_a
    end
  end
end
