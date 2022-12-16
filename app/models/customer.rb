# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user, optional: true
  validates :user_id, uniqueness: true, if: -> { user_id.present? }
  has_many :contracts
  has_many :tool_numbers, through: :contracts
end
