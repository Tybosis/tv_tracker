class ContactMailer < ActionMailer::Base
  default to: 'tvtrackerapplication@gmail.com'

  def send_mail(contact)
    @contact = contact
    mail(from: @contact.email, subject: "New Message")
  end
end
