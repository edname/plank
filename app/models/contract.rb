class Contract < ApplicationRecord
  belongs_to :customer
  belongs_to :tool_number
end
