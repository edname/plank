# frozen_string_literal: true

class Tool < ApplicationRecord
  has_many :toolVariants

  validates :name, presence: true, uniqueness: true
end
