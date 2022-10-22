class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.integer :team_id
      t.integer :opponent_id
      t.date :date

      t.timestamps
    end
  end
end
