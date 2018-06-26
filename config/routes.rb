Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/contact" => "api/contacts#get_contact"
  get "/allcontacts" => "api/contacts#get_all"
  #Api::ContactsController#get_all is missing a template for this request format and variant.<-- read later
end
