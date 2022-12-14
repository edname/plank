# frozen_string_literal: true

class User < ApplicationRecord
  has_one :customer
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
