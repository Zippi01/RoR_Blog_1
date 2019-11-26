class Author < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validate :email_valid, :password_valid

  private

  def email_valid
    unless email.include?('@')
      errors.add(:email, "Email must contain '@'")
    end
  end

  def password_valid
    unless  password.count("a-z") > 0 && password.count("A-Z") > 0 && password.count((0-9).to_s) > 0
      errors.add(:password, "Password must contain 1 small letter, 1 capital letter and number")
    end
  end
end
