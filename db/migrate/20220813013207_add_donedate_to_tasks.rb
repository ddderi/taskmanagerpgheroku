class AddDonedateToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :donedate, :datetime
  end
end
