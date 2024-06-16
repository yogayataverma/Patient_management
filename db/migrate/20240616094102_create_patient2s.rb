class CreatePatient2s < ActiveRecord::Migration[7.1]
  def change
    create_table :patient2s do |t|
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
