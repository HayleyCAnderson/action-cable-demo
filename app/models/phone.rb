class Phone < ApplicationRecord
  validates :name, :number, presence: true, uniqueness: true
end
