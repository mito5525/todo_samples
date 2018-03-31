class TaskRepository < Hanami::Repository
  def find_by_user(user_id)
    tasks.where(user_id: user_id)
  end
end
