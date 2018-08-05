Rails.application.routes.draw do
  resources :incidents, only: [:new, :create, :show]
  
  root "home#index"
  get '*path' => redirect('/')
end
