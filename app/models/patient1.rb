# app/models/patient.rb
class Patient1 < ApplicationRecord
    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    validates :gender, presence: true
    validates :phone_number, presence: true
    validates :email, presence: true
    validates :doctor, presence: true
  
    # Optionally, you can include any other associations, methods, or callbacks here
  
  end
  