require 'rails_helper'

RSpec.describe Question, type: :model do

  #バリデーションを通過する状態であること
  it "is valid with valid attributes" do
    question = FactoryBot.build(:question)
    expect(question).to be_valid
  end

  #問題文が空の状態が無効てあること
  it "is valid without a content" do
    question = FactoryBot.build(:question, content: nil)
    expect(question).to_not be_valid
  end

  #問題文が短い状態が無効であること
  it "is not valid with content length short" do
    question = FactoryBot.build(:question, content: "football")
    expect(question).to_not be_valid
  end

  #問題文がオーバーしている状態が無効であること
  it "is not valid with content length exceeding maximum" do
    content = "football" * 100
    question = FactoryBot.build(:question, content: content)
    expect(question).to_not be_valid
  end

end
