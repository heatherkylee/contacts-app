class Api::ContactsController < ApplicationController
  def index
    # to get all the contacts
    # @contacts = Contact.all
    if current_user
        @contacts = current_user.contacts 
        render "index.json.jbuilder"
    else
      render json: []
    end
  end

  def show
    contact_id = params[:id]
    @contact1 = Contact.find_by(id: contact_id)
    render "show.json.jbuilder"
  end

  def create
    @contact1 = Contact.new(
      first_name: params[:input_first_name],
      middle_name: params[:input_middle_name],
      last_name: params[:input_last_name],
      phone_number: params[:input_phone_number],
      email: params[:input_email],
      bio: params[:input_bio],
      user_id: current_user.id
      )
    @contact1.save
    render "show.json.jbuilder"
  end

  def update
    contact_id = params[:id]
    @contact1 = Contact.find_by(id: contact_id)
    @contact1.first_name = params[:input_first_name] || @contact1.first_name
    @contact1.middle_name = params[:input_middle_name] || @contact1.first_name
    @contact1.last_name = params[:input_last_name] || @contact1.last_name
    @contact1.phone_number = params[:input_phone_number] || @contact1.phone_number
    @contact1.email = params[:input_email] || @contact1.email
    @contact1.bio = params[:input_bio] || @contact1.bio
    @contact1.save
    render "show.json.jbuilder"
  end

  def destroy
    contact_id = params[:id]
    @contact1 = Contact.find_by(id: contact_id)
    @contact1.destroy
    render json: {message: "Item has been deleted"}
  end
end
