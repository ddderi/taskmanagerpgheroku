class AddDisplayToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :display, :boolean, default: true
  end
end
