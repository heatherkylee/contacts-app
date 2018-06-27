Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/contact" => "contacts#get_contact"
    get "/allcontacts" => "contacts#get_all"
  end
  #Api::ContactsController#get_all is missing a template for this request format and variant.<-- read later
end
