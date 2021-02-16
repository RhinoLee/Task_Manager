class AddStatusDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :string, :default => ''
    Task.where(status: nil).update_all(status: '')
  end
end
