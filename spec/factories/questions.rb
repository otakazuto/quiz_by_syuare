# Question ファクトリ
FactoryBot.define do
    factory :question do
        sequence(:content) { |n| "Question #{n}" }

        # ...

        # 関連する Answer レコードと Choice レコードを生成
        factory :question_with_associations do
            transient do
                answers_count { 1 } # 1つの回答
                choices_count { 3 } # 4つの選択肢
            end

            after(:create) do |question, evaluator|
                create_list(:answer, evaluator.answers_count, question: question)

                # 4つの選択肢を生成
                choices = create_list(:choice, evaluator.choices_count, question: question)

                # 1つの選択肢に :correct トレイトを追加して is_correct を true にする
                create(:choice, :correct, question: question) if evaluator.choices_count > 0
            end
        end
    end
end