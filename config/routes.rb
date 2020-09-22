Rails.application.routes.draw do
  resources :surgeries, only: [:index, :show]

  resources :doctor_surgeries, only: [:new, :create]

  post '/surgeries/:surgery_id', to: 'doctor_surgeries#create'
end
