# frozen_string_literal: true

class ToolNumber < ApplicationRecord
  belongs_to :tool_list

  has_and_belongs_to_many :contracts
  has_many :customers, through: :contracts

  validates :number, presence: true, numericality: true, uniqueness: { scope: :tool_list }
end
