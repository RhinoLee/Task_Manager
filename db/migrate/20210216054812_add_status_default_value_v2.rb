class AddStatusDefaultValueV2 < ActiveRecord::Migration[6.1]
  def up
    change_column :tasks, :status, :string, :default => '待處理'
    Task.where(status: [nil, ""]).update_all(status: '待處理')
  end

  def down
    change_column :tasks, :status, :string, :default => ''
    Task.where(status: nil).update_all(status: '')
  end
end
