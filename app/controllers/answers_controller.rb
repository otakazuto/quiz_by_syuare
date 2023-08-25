class AnswersController < ApplicationController
  def show
    @answer = Answer.find_by(question_id: params[:id])
    @selected_choice_text = session[:selected_choice_text]
    @select_answer = Choice.find_by(choice_text: @selected_choice_text)

    #if @answer.nil?
    #  flash[:error] = '回答が見つかりませんでした。'
    #  redirect_to root_path # 回答がない場合はrootに飛ぶ
    #end
  end

  def check_answer
    data = params[:choice_text]
    session[:selected_choice_text] = data

    @select_answer = Choice.find_by(choice_text: data)
    if @select_answer
      redirect_to answer_path(@select_answer.question_id)
    else
      redirect_to root_path
    end

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
  end
  
end
