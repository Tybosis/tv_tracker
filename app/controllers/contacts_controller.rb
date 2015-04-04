class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    SendEmailJob.set(wait: 20.seconds).perform_later(@contact.deliver)
    flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
  end
end
