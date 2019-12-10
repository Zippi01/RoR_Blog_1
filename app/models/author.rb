class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  before_create :confirmation_token
  after_create :send_confirmation


  has_secure_password

  validates :email, presence: true, uniqueness: true
  validate :email_valid
  validates :password_digest, presence: true, length: { minimum: 8 }

  def email_activate
   self.email_confirmed = true
   self.confirm_token = nil
   save!(:validate => false)
 end

  private

  def send_confirmation
      UserMailer.sample_email(self).deliver!
  end

  def confirmation_token
   if self.confirm_token.blank?
     self.confirm_token = SecureRandom.urlsafe_base64.to_s
   end
  end

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
