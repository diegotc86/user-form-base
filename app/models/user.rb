class User < ApplicationRecord
  validates_length_of :first_name, presence: true,  minimum: 2, maximum: 60
  validates_length_of :last_name, presence: true,  minimum: 2, maximum: 60
  validates :username, presence: true, uniqueness: true, minimum: 2, maximum: 20
  validates :email, presence: true, confirmation: true, uniqueness: true, format: { with: [a-zA-Z0-9]+[a-zA-Z0-9]+{2,3} }
  validates :email_confirmation,  presence: true
  validates :password, presence: true, minimum: 8, confirmation: true, format: { with: [0-9] }
  validates :password_confirmation, presence: true
  validates :hint, maximum: 100


  def full_name
    "#{first_name} #{last_name}"
  end


end
