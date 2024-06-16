# db/migrate/timestamp_create_patients.rb

class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients1 do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :phone_number
      t.string :email
      t.string :doctor
      t.timestamps
    end
  end
end
