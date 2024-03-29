GoalSetterApp::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :comments, only: [:new, :create, :destroy]
end
