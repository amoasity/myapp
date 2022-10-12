class AddStatusToSecondSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :second_schedules, :status, :integer
  end
end
