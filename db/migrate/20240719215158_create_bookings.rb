class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :service, null: false, foreign_key: true
      t.string :user_email
      t.string :user_name
      t.datetime :booking_time

      t.timestamps
    end
  end
end
