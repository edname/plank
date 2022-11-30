# frozen_string_literal: true

class ToolVariant < ApplicationRecord
  belongs_to :tool

  validates :tool_number, presence: true
end