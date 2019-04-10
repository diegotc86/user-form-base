class User < ApplicationRecord
  validates :first_name, presence: true, length: { in: 2..60 }
  validates :last_name, presence: true, length: { in: 2..60 } #alow_nill is u want this space in blank
  validates :username, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :email, presence: true, confirmation: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ } ##[a-zA-Z0-9]+[a-zA-Z0-9]+[2.3]
  validates :email_confirmation,  presence: true
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, format: { with: /.*[0-9].*/ }
  validates :password_confirmation, presence: true
  validates :password_hint, length: { maximum: 100 } 


  def full_name
    "#{first_name} #{last_name}"
  end


end
