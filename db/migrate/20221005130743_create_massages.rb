class CreateMassages < ActiveRecord::Migration[7.0]
  def change
    create_table :massages do |t|
      t.integer :user_id
      t.integer :talk_room_id
      t.text :content

      t.timestamps
    end
  end
end
