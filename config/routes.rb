Rails.application.routes.draw do
  resources :surgeries, only: [:index, :show]

  resources :doctor_surgeries, only: [:new, :create]
end
