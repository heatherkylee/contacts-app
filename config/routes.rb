Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    #GET all contacts
    get "/contacts" => "contacts#index"
    #GET single contact
    get "/contacts/:id" => "contacts#show"
    #create a new contact
    post "/contacts" => "contacts#create"
    #update an existing product
    patch "/contacts/:id" => "contacts#update"
    #delete a specific dontact
    delete "/contacts/:id" => "contacts#destroy"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
  #Api::ContactsController#get_all is missing a template for this request format and variant.<-- read later
end
