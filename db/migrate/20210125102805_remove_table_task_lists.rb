class RemoveTableTaskLists < ActiveRecord::Migration[6.1]
  def change
    drop_table(:task_lists)
  end
end
