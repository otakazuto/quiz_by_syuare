class CyclesController < ApplicationController

    def control_session
        if session[:count]
            session[:count] += 1
        else
            session[:count] = 0
            session[:true_count] = 0
            session[:false_count] = 0
        end

        if session[:count] == 5
            session.delete(:count)
            session.delete(:true_count)
            session.delete(:false_count)

            redirect_to root_path
        else
            redirect_to question_path(1)
        end
    end

    def count_questions
        data = params[:choice_text]
        session[:selected_choice_text] = data

        @select_answer = Choice.find_by(choice_text: data)

        if @select_answer.is_correct == true
            session[:true_count] += 1
        else
            session[:false_count] += 1
        end

        redirect_to answer_path(@select_answer.question_id)
    end
end
