class AddUserIdToTask < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, index: true
    add_foreign_key :tasks, :users
  end
end
