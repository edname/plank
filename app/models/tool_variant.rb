class ToolVariant < ApplicationRecord
    belongs_to :tool

    validates :tool_number, presence: true, uniqueness: true
end
