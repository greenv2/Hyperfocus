Rails.application.routes.draw do
  resources :study_guides
  get 'pages/edit'

  #set the index page
  root 'pages#home'

  get 'pages/home'

  get 'pages/new'

  get 'pages/generate'

  get 'pages/download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
