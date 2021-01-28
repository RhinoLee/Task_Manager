class RemoveForeignFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:tasks, :task_lists, foreign_key: true)
  end
end
