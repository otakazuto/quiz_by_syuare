class ResultsController < ApplicationController
  def show
    @true_count = session[:true_count]
    @false_count = session[:false_count]
  end
end
