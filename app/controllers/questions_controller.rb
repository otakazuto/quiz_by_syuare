class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @question = Question.find(params[:id])
    @choices = Choice.where(params[:question_id])
  end

  private

  def record_not_found
    flash[:error] = "レコードが見つかりませんでした。"
    redirect_to root_path
  end
end
