require 'wikipedia'

class AnswersController < ApplicationController
  def show
    @answer = Answer.find_by(question_id: params[:id])
    @selected_choice_text = session[:selected_choice_text]
    @select_answer = Choice.find_by(choice_text: @selected_choice_text)
    
    if session[:true_count] && session[:false_count]
      @true_count = session[:true_count]
      @false_count = session[:false_count]
    end
    
    @count = session[:count]
    
    get_wikipedia_information
    
    case I18n.locale
    when :ja
      render "answers/ja/show"
    when :en
      render "answers/en/show"
    end
    
    #if @answer.nil?
    #  flash[:error] = '回答が見つかりませんでした。'
    #  redirect_to root_path # 回答がない場合はrootに飛ぶ
    #end
  end

  #"cyclesコントローラ―のcount_questionアクション内で実行するため不要"
  #def check_answer
  #  data = params[:choice_text]
  #  session[:selected_choice_text] = data

  #  @select_answer = Choice.find_by(choice_text: data)
  #  if @select_answer
  #    redirect_to answer_path(@select_answer.question_id)
  #  else
  #    redirect_to root_path
  #  end

    #以下はデータを受け取れているかを確認した物
    #if @select_answer
    #  if @select_answer.is_correct == true
    #    redirect_to answer_path(@select_answer.question_id)
    #  else
    #    redirect_to question_path(@select_answer.question_id)
    #  end
    #else
    #  redirect_to root_path
    #end
  #end

private

  def get_wikipedia_information

    wiki_data = Wikipedia.find(@select_answer.choice_text)
    @wiki_link = wiki_data.fullurl

    if wiki_data.summary.blank?
      @wiki_info = "Wikipediaに情報がありません"
    else
      @wiki_info = wiki_data.summary[0, 150] + (wiki_data.summary.length > 150 ? "....." : "")
    end
  end
end
