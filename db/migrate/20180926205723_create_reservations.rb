class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reserve_date
      t.time :time_start
      t.time :time_end
      t.string :status
      t.string :group
      t.string :activity
      t.string :person
      t.string :phone

      t.timestamps
    end
  end
end
