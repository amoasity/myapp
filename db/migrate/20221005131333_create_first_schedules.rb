class CreateFirstSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :first_schedules do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :month
      t.integer :fir
      t.integer :sec
      t.integer :thi
      t.integer :fou
      t.integer :fif
      t.integer :six
      t.integer :sev
      t.integer :eig
      t.integer :nin
      t.integer :ten
      t.integer :ele
      t.integer :twe
      t.integer :ten_thi
      t.integer :ten_fou
      t.integer :ten_fif
      t.integer :ten_six
      t.integer :ten_sev
      t.integer :ten_eig
      t.integer :ten_nin
      t.integer :twentieth
      t.integer :twe_fir
      t.integer :twe_sec
      t.integer :twe_thi
      t.integer :twe_fou
      t.integer :twe_fif
      t.integer :twe_six
      t.integer :twe_sev
      t.integer :twe_eig
      t.integer :twe_nin
      t.integer :thirtieth
      t.integer :thi_fir

      t.timestamps
    end
  end
end
