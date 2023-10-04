class Question < ApplicationRecord
    validates :content, presence: true
    validates :content, length: { in: 10..100 }
end
