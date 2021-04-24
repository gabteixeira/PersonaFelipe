Rails.application.routes.draw do
  resources :personagems
  
  root 'welcome#index' 
  get 'welcome/index'
  get '/todos' => 'welcome#todos'
  get '/todosPersonagens' => 'welcome#todosPersonagens'
  post 'welcome/index' => 'personagems#create' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
