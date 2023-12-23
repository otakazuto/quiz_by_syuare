require 'rails_helper'

RSpec.describe Answer, type: :model do
  
  #バリデーションを通過する状態であること
  it "is valid with valid attributes" do
    answer = FactoryBot.build(:answer, :relevance)
    expect(answer).to be_valid
    expect(answer.question).to be_present
  end

  #回答が空の状態が無効てあること
  it "is valid without a content" do
    answer = FactoryBot.build(:answer, explanation: nil)
    expect(answer).to_not be_valid
  end

  #解答がオーバーしている状態が無効であること
  it "is not valid with explanation length exceeding maximum" do
    explanation = "football" * 100
    answer = FactoryBot.build(:answer, explanation: explanation)
    expect(answer).to_not be_valid
  end

  #it 'データの確認' do
  #  answer = FactoryBot.build(:answer)
  #    puts " Question ID: #{answer.question_id}, explanation: #{answer.explanation}"
  #end

end
