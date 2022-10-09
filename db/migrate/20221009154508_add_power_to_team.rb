class AddPowerToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :power, :integer
  end
end
