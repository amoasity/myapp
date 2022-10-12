class AddStatusToFirstSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :first_schedules, :status, :integer
  end
end
