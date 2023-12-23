require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Example System Spec', type: :system, js: true do
    before do

        @question1 = FactoryBot.create(:question_with_associations)
        @question2 = FactoryBot.create(:question_with_associations)
        @question3 = FactoryBot.create(:question_with_associations)
        @question4 = FactoryBot.create(:question_with_associations)
        @question5 = FactoryBot.create(:question_with_associations)
        @count = 1
    end

    #クイズの流れのテスト
    it "allows the user to complete a quiz and return to the home page" do
        # ホームからスタートボタンを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("START")

        # 問題ページに遷移し、選択肢を選択する
        5.times do
            expect(page).to have_content("第#{@count}問") #問題ページが表示されているか確認
            
            #何問目か確認
            #puts("今#{@count}問目です")

            # ページ上の全てのボタンを取得
            buttons = all('button')

            # buttonsからランダムに一つのボタンを選択
            random_button = buttons.sample

            # ランダムに選択肢をクリック
            random_button.click

            if @count < 5
                # 解答ページに遷移し、次へを押す
                expect(page).to have_content("正解") # 解答ページが表示されていることを確認
                @count += 1
                click_button "次へ" # 次の質問へ
        

            else
                # 5問目の解答ページに結果発表のボタンが表示され、ボタンを押して結果発表ページに遷移する
                click_button "結果発表"
                expect(page).to have_content("結果発表") #resutページが表示されているか確認
                click_button 'HOME'

                # ホームページに戻ったことを確認
                expect(page).to have_content("CLICK or TAP") # ホームページのテキストを確認
                
                #ホームに戻ったことを確認
                #puts("ホームに戻りました")
            
            end
        end
    end
end