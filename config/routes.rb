Rails.application.routes.draw do

  root 'access#login'

  ## Login ##
  get '/login' => 'access#login'
  get '/logout' => 'access#logout'
	
  resources :users

  get '/generate_pdf/show' => 'generate_pdf#show'

  match ':controller(/:action(/:id))', :via => [:get, :post]


end
