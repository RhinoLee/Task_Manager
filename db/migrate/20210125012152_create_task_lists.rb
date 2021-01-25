class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
