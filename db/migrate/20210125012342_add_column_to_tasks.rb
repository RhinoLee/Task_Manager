class AddColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :start_time, :datetime
    add_column :tasks, :end_time, :datetime
    add_column :tasks, :level, :integer
    add_column :tasks, :status, :string
    add_column :tasks, :category, :string
    add_column :tasks, :position, :integer
    add_belongs_to :tasks, :task_lists, foreign_key: true
  end
end
