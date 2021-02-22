class AddLevelDefaultValueV2 < ActiveRecord::Migration[6.1]
  def up
    change_column :tasks, :level, :integer, :default => 0
    Task.where(level: [nil, ""]).update_all(level: 0)
  end

  def down
    change_column :tasks, :level, :integer
  end
end
