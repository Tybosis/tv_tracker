class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def send_mail
    name = params[:name]
    email = params[:email]
    message = params[:message]
    ContactMailer.contact_email(name, email, message).deliver
    redirect_to contacts_path, notice: 'Message sent'
  end
end
