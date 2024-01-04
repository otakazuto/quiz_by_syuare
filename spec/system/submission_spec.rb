require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Example System Spec', type: :system, js: true do

    #投稿機能のテスト(正常)
    it "Success of the submission function" do
        #ホーム画面からフォーム画面のリンクを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("こちら")

        #フォーム画面に遷移し、フォームに入力する
        expect(page).to have_content("下記のフォームに入力して問題を作成しましょう。")

        fill_in "question[content]", with: "サッカーは何人でするでしょうか。"
        
        #4つの選択肢のフォームに入力
        fill_in "question[choices[0]][choice_text]", with: "10人"
        fill_in "question[choices[1]][choice_text]", with: "11人"
        fill_in "question[choices[2]][choice_text]", with: "12人"
        fill_in "question[choices[3]][choice_text]", with: "13人"    

        
        check('question[choices[1]][is_correct]')

        fill_in "question[answer][explanation]", with: "正解は11人です。フィールド、キーパー合わせて11人で試合を行います。"

        click_button '送信'

        #送信が完了したか確認
        expect(page).to have_content("送信が完了しました。ご協力ありがとうございます。")
    end

    #questionフォームの異常(フォームに入力されていない)
    it "Question Form Abnormalities" do
        #ホーム画面からフォーム画面のリンクを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("こちら")

        #フォーム画面に遷移し、フォームに入力する
        expect(page).to have_content("下記のフォームに入力して問題を作成しましょう。")

        
        #4つの選択肢のフォームに入力
        fill_in "question[choices[0]][choice_text]", with: "10人"
        fill_in "question[choices[1]][choice_text]", with: "11人"
        fill_in "question[choices[2]][choice_text]", with: "12人"
        fill_in "question[choices[3]][choice_text]", with: "13人"    

        
        check('question[choices[1]][is_correct]')

        fill_in "question[answer][explanation]", with: "正解は11人です。フィールド、キーパー合わせて11人で試合を行います。"

        click_button '送信'

        #送信が完了したか確認
        expect(page).to have_content("送信に失敗しました。()内の規定したがって作成してください。")
    end
    
    #choicesフォームの異常(choiceフォームが全て入力されていない)
    it "Choice form anomalies" do
        #ホーム画面からフォーム画面のリンクを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("こちら")

        #フォーム画面に遷移し、フォームに入力する
        expect(page).to have_content("下記のフォームに入力して問題を作成しましょう。")

        fill_in "question[content]", with: "サッカーは何人でするでしょうか。"
        
        #4つの選択肢のフォームに入力
        fill_in "question[choices[0]][choice_text]", with: "10人"
        fill_in "question[choices[1]][choice_text]", with: "11人"
        fill_in "question[choices[2]][choice_text]", with: "12人"   

        
        check('question[choices[1]][is_correct]')

        fill_in "question[answer][explanation]", with: "正解は11人です。フィールド、キーパー合わせて11人で試合を行います。"

        click_button '送信'

        #送信が完了したか確認
        expect(page).to have_content("送信に失敗しました。()内の規定したがって作成してください。")
    end

    #choicesフォームの異常(チェックボックスがチェックされていない)
    it "Choice form anomalies 2" do
        #ホーム画面からフォーム画面のリンクを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("こちら")

        #フォーム画面に遷移し、フォームに入力する
        expect(page).to have_content("下記のフォームに入力して問題を作成しましょう。")

        fill_in "question[content]", with: "サッカーは何人でするでしょうか。"
        
        #4つの選択肢のフォームに入力
        fill_in "question[choices[0]][choice_text]", with: "10人"
        fill_in "question[choices[1]][choice_text]", with: "11人"
        fill_in "question[choices[2]][choice_text]", with: "12人"
        fill_in "question[choices[3]][choice_text]", with: "13人"    

        fill_in "question[answer][explanation]", with: "正解は11人です。フィールド、キーパー合わせて11人で試合を行います。"

        click_button '送信'

        #送信が完了したか確認
        expect(page).to have_content("送信に失敗しました。()内の規定したがって作成してください。")
    end

    #answerフォームの異常(フォームに入力されていない)
    it "answer form anomalies" do
        #ホーム画面からフォーム画面のリンクを押す
        visit root_path
        expect(page).to have_content("CLICK or TAP")
        click_link ("こちら")

        #フォーム画面に遷移し、フォームに入力する
        expect(page).to have_content("下記のフォームに入力して問題を作成しましょう。")

        fill_in "question[content]", with: "サッカーは何人でするでしょうか。"
        
        #4つの選択肢のフォームに入力
        fill_in "question[choices[0]][choice_text]", with: "10人"
        fill_in "question[choices[1]][choice_text]", with: "11人"
        fill_in "question[choices[2]][choice_text]", with: "12人"
        fill_in "question[choices[3]][choice_text]", with: "13人"    

        
        check('question[choices[1]][is_correct]')

        click_button '送信'

        #送信が完了したか確認
        expect(page).to have_content("送信に失敗しました。()内の規定したがって作成してください。")
    end

end