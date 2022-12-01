# frozen_string_literal: true

class ToolList < ApplicationRecord
  belongs_to :tool_category
  has_many :tool_numbers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
