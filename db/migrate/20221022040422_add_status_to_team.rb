class AddStatusToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :status, :integer
  end
end
