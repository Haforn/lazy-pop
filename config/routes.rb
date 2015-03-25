Rails.application.routes.draw do

  root 'access#login'

  ## Login ##
  get '/login' => 'access#login'
  get '/logout' => 'access#logout'

  #get '/generate_pdf' => 'generate_pdf#pdf' 

  get '/generate_pdf/show' => 'generate_pdf#show'

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
