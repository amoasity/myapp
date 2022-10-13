class ChangeDataOverviewToTeam < ActiveRecord::Migration[7.0]
  def change
    change_column :teams, :overview, :string
  end
end
