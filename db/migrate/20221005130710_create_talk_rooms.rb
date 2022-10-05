class CreateTalkRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :talk_rooms do |t|
      t.integer :status
      t.integer :team_id
      t.integer :applyer_team_id
      t.integer :receiver_team_id

      t.timestamps
    end
  end
end
