# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :old_password
  has_one :customer
  has_secure_password validations: false

  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? }
  validates :password, confirmation: true, allow_blank: true,
            length: {minimum:8, maximum:70}

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true

  validates :username, presence: true, uniqueness: true

  validate :password_complexity

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorect'
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}/

    errors.add :password, 'complexity requirement not met. Minimum eight characters and at least one letter and one number'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
  
end
