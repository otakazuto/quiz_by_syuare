class Question < ApplicationRecord
    has_one :answer
    has_many :choices

    validates :content, presence: true
    validates :content, length: { in: 10..100 }
end
