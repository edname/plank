# frozen_string_literal: true

class ToolCategory < ApplicationRecord
  has_many :tool_list, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
