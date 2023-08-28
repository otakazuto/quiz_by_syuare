class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @question = Question.find(params[:id])
    @choices = Choice.where(question_id: params[:id])
    #@ids = session[:questions_id]

    @count = session[:count] + 1

  end

  private

  def record_not_found
    flash[:error] = "レコードが見つかりませんでした。"
    redirect_to root_path
  end
end
