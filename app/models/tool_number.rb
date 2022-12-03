# frozen_string_literal: true

class ToolNumber < ApplicationRecord
  belongs_to :tool_list

  validates :number, presence: true, numericality: true, uniqueness: { scope: :tool_list }
end