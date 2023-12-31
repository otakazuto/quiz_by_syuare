Rails.application.routes.draw do
  get 'results/show'
  
  root "test#index"
  
  resources :test, only: %i[index]
  resources :questions, except: %i[index edit update destroy]
  resources :answers, only: %i[show]
  resources :results, only: %i[show]

  get '/control_session', to: 'cycles#control_session' 
  get '/count_questions', to: 'cycles#count_questions'
  get '/browserback_session', to: 'cycles#browserback_session'
end
