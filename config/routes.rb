Rails.application.routes.draw do

  root 'access#login'

  #get '/generate_pdf' => 'generate_pdf#pdf' 

  get '/generate_pdf/show' => 'generate_pdf#show'

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
