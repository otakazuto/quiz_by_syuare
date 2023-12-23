class Answer < ApplicationRecord
  belongs_to :question

  validates :explanation, presence: true
  validates :explanation, length: { in: 10..100 }
end
