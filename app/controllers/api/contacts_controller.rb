class Api::ContactsController < ApplicationController
  def get_contact
    @contact1 = Contact.first
    render "contact_view.json.jbuilder"
  end

  def get_all
    @message = "message"
    render "all_view.json.jbuilder"
  end

end
