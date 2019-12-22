class Author < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  before_create :confirmation_token
  after_create :send_confirmation


  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  # validate :email_valid
  # validates :password, presence: true, length: { minimum: 8 }
  validates :password, presence: true, allow_nil: true
  validate :password_valid

  def email_activate
     self.email_confirmed = true
     self.confirm_token = nil
     save!(:validate => false)
  end

  def password_reset
    confirmation_token
    self.pass_time = Time.zone.now
    save!(:validate => false)
    UserMailer.pass_reset(self).deliver!
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
    if password.present?
      if password.count('a-z') <= 0 || password.count('A-Z') <= 0 || password.count('0-9') <= 0
        errors.add(:password, 'Must contain 1 small letter, 1 capital letter, 1 number and minimum 8 symbols')
      end
    end
  end
end
