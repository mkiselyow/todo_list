class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string    :name
      t.integer   :priority
      t.boolean   :status
      t.datetime  :deadline

      t.timestamps
    end
  end
end
