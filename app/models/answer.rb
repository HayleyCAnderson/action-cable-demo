class Answer < ApplicationRecord
  belongs_to :survey

  validates :survey, :number, :text, presence: true
  validates :number, uniqueness: { scope: :survey, message: 'is unique per survey' }
end
