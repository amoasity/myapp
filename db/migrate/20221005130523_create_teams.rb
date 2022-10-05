class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :captain_id
      t.integer :average_age
      t.integer :active_area

      t.timestamps
    end
  end
end
