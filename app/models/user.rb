class User < ApplicationRecord
  validates :first_name, presence: true, length: { in: 2..60 }
  validates :last_name, presence: true, length: { in: 2..60 }
  validates :username, presence: true, uniqueness: true , length: { in: 2..20 }
  validates :email, confirmation: true, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :email_confirmation, presence: true
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, format: { with: /.*[0-9].*/ }
  validates :password_confirmation, presence:true
  validates :password_hint, length: { maximum: 100 }
  before_save :expection_lastname
  def full_name
    "#{first_name} #{last_name}"
  end

  def expection_lastname
    self.last_name = self.last_name.split.map do |word|
      if ["del", "la", "de"].include?(word)
        word
      else
        word.capitalize
      end
    end.join(" ")
  end

end
