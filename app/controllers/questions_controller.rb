class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @question = Question.find(params[:id])
    @choices = Choice.where(question_id: params[:id])
    #@ids = session[:questions_id]

    @count = session[:count] + 1

  end

  def new
    @question = Question.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @question = Question.create!(question_params)
        answer = @question.create_answer(answer_params)
        raise if answer[:explanation].blank?

        choice_create_count = 0
        true_count = 0
        4.times do
          choice = @question.choices.create(choice_params(choice_create_count))
          raise if choice[:choice_text].blank?

          if choice[:is_correct] == true
            true_count += 1
          end
          choice_create_count += 1
        end
        raise if true_count != 1

        flash[:notice] = "送信が完了しました。ご協力ありがとうございます。"
        redirect_to root_path
      end
    rescue
      flash[:alert] = "送信に失敗しました。()内の規定したがって作成してください。"
      redirect_to new_question_path
    end
  end

  private

  def record_not_found
    flash[:error] = "レコードが見つかりませんでした。"
    redirect_to root_path
  end

  def question_params
    params.require(:question).permit(:content)
  end

  def choice_params(index)
    params.require(:question).require(:choices).require(index.to_s).permit(:choice_text,:is_correct)
  end

  def answer_params
    params.require(:question).require(:answer).permit(:explanation)
  end

end
