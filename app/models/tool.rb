class Tool < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
