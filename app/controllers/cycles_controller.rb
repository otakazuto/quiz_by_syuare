class CyclesController < ApplicationController

    def control_session
        if session[:count]
            session[:count] += 1
        else
            session[:count] = 0
            session[:true_count] = 0
            session[:false_count] = 0
            session[:questions_id] = Question.pluck(:id)
        end

        if session[:count] == 5
            session.delete(:count)
            session.delete(:true_count)
            session.delete(:false_count)
            session.delete(:questions_id)

            redirect_to root_path
        else
            ids = session[:questions_id]
            random_id = ids.sample
            session[:questions_id].delete(random_id)

            redirect_to question_path(random_id)
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

    def browserback_session
        session.delete(:count)
        session.delete(:true_count)
        session.delete(:false_count)
        session.delete(:questions_id)

        redirect_to root_path
    end
end
