FactoryBot.define do

  factory :choice do
    sequence(:choice_text) { |n| "Choice #{n}" }

    trait :correct do
      is_correct { true }
    end
    
    trait :relation do
      association :question
    end
  end
end