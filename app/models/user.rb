class User < ApplicationRecord
  validates :first_name, :last_name, length: { in: 2..60 }
  validates :username, uniqueness: { case_sensitive: false }, length: { in: 2..20 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, confirmation: true
  validates :password, format: { with: /.*[0-9].*/, message: "has to at least one number" }, length: { minimum: 8 }
  validates :email_confirmation, :password_confirmation, presence: true
  validates :password_hint, length: { maximum: 100 }
  before_save :capitalize_first_name, :capitalize_last_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def capitalize_first_name
    self.first_name.capitalize
  end

  def capitalize_last_name
    self.last_name.downcase.split.map do |word|
      if ["del", "la", "de", "las"].include?(word)
        word
      else
        word.capitalize
      end
    end.join(" ")
  end
end
