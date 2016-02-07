class Survey < ApplicationRecord
  has_many :answers

  validates :name, :question, presence: true
  validates :name, uniqueness: true
end
