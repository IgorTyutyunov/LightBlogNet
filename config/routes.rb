Rails.application.routes.draw do
  get 'welcom/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcom#index'
  resources :articles do
  resources :comments
end
end
