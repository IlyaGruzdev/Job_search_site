class User < ApplicationRecord
  attr_accessor :old_password, :remember_token
  has_many :tasks
  has_secure_password validations: false
  validates :email, presence: true, uniqueness: true , 'valid_email_2/email': true
  validates :name, presence: true
  validate :password_presence
  validate :correct_old_password, on: :update
  validates :password, confirmation: true, allow_blank: true, length: {minimum: 5, maximum: 50}
  validate :password_complexity

  def remember_me
    self.remember_token=SecureRandom.urlsafe_base64
    update_column :remember_token_digest, digest(remember_token)
  end

  def remember_token_authenticated?(remember_token)
    BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
  end
 private
 def digest(string)
  cost = ActiveModel::SecurePassword.
  min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
 end
  def password_complexity
  return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{5,50}$/
  errors.add :password, 'Complexity requirement not met. Length should be 5-50 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)
    errors.add :old_password, 'is incorrect'
  end
  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
 
end
