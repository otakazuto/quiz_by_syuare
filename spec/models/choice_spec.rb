require 'rails_helper'

RSpec.describe Choice, type: :model do

    #バリデーションを通過する状態であること
    it "is valid with valid attributes" do
        choice = FactoryBot.build(:choice, :relation)
        expect(choice).to be_valid
        expect(choice.question).to be_present
    end

    #問題文が空の状態が無効てあること
    it "is valid without a content" do
        choice = FactoryBot.build(:choice, choice_text: nil)
        expect(choice).to_not be_valid
    end



end
