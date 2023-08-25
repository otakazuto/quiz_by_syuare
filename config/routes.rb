Rails.application.routes.draw do
  
  root "test#index"
  
  resources :test, only: %i[index]
  resources :questions, only: %i[show]
  resources :answers, only: %i[show]

  get '/check_answer', to: 'answers#check_answer'
end