Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :users, only: [:index]
  get 'welcome/index'
  root 'welcome#index'
  def index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
