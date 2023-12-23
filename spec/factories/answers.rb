FactoryBot.define do

  factory :answer do
    sequence(:explanation) { |n| "AnswerAnswerAnswer #{n}" }

    trait :relevance do
      association :question
    end
  end

end