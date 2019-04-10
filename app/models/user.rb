class User < ApplicationRecord
  # Must be between 2 and 60 characters
  validates :first_name,
            length: { in: 2..60 }

  # Must be between 2 and 60 characters          
  validates :last_name, 
            length: { in: 2..60 }

  # Must be unique. Must be between 2 and 20 characters
  validates :username, 
            {uniqueness: true, length: { in: 2..20 }}

  # Must be unique. Must be a valid email. Must be the same as the email.
  # (FALTA VALIDAR EMAIL)
  validates :email, 
            confirmation: { case_sensitive: false },
            uniqueness: true, 
            format: { with: /\A[a-zA-Z0-9]+\z/}, 
            confirmation: true
  
  # At least 8 characters. Must contain at least 1 number. Must the same as the password. 
  # (FALTA VALIDAR 1+ NUMEROS)
  validates :password, 
             length: { minimum: 8 }, 
             format: { with: /\A[a-zA-Z0-9][a-zA-Z0-9_]*\z/ }, 
             confirmation: true

  #Optional. Must be 100 characters max.
  validates :password_hint, 
            presence: false,
            length: { maximum: 100 }


#   def full_name
#     "#{first_name} #{last_name}"
end
