class AddOverviewToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :overview, :text
  end
end
