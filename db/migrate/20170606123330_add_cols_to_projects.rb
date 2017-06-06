class AddColsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :user_id, :integer
    add_index :projects, [:user_id, :created_at]
  end
end
