require 'uri'
class User < ApplicationRecord
  #First Name	Must be between 2 and 60 characters
  validates :first_name, presence: true, length: {minimum: 2, maximum: 60}

  #Last Name	Must be between 2 and 60 characters
  validates :last_name, presence: true, length: { in: 2..60 }
 
  #Username	Must be unique. Must be between 2 and 20 characters
  validates :username, presence: true, uniqueness: true

  #Email	Must be unique. Must be a valid email.
  #Email Confirmation	Must be the same as the email. 
  validates :email, presence: true, confirmation: true, uniqueness: true, 
  format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  #Password	At least 8 characters. Must contain at least 1 number.
  #Password Hint	Optional. Must be 100 characters max.
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,100}\z/, message: "must be at least 8 characters and include one number and one letter."}


 before_save :capitalize_names

  def full_name
    "#{first_name} #{last_name}"
  end

  def capitalize_names
    self.first_name = first_name.downcase.camelcase
    nocaps = ["de", "la", "del"]
    self.last_name =last_name.downcase.split.map { |word| nocaps.include?(word) ? word : word.capitalize }.join(" ")
  end
end

# @user = User.create( first_name: "MAYRA", last_name: "DE LA NAVARRO", username: "lunav", email: "aaa@aaa.com", email_confirmation: "aaa@aaa.com", password: "Password1", password_confirmation: "Password1",password_hint: "no quiero")
# @user1 = User.create( first_name: "M", last_name: "D", username: "lunav", email: "aaa@aaa.com", email_confirmation: "aa@aaa.com", password: "Password1", password_confirmation: "password$1",password_hint: "no quiero")



