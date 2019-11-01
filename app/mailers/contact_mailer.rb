class ContactMailer < ApplicationMailer


  def general_message(contact)
    @contact = contact
    mail(:to => "bellamvamsikrishna3415@gmail.com", :subject => "You Have a Message From Your Website")
  end
end
