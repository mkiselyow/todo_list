class AddAvatarColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.has_attached_file :avatar
    end
  end
end
