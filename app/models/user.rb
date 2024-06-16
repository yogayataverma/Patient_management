class User < ApplicationRecord
    ROLES = %w[Doctor Receptionist].freeze
  
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, inclusion: { in: ROLES }

    has_secure_password
    
  end
  