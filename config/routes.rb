Rails.application.routes.draw do
  
  root "test#index"
  
  resources :test, only: %i[index]
  resources :questions, only: %i[show]

end
