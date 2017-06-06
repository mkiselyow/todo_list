class AddColsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :project_id, :integer
    add_index :tasks, [:user_id, :created_at]
    add_index :tasks, [:project_id, :created_at]
  end
end
