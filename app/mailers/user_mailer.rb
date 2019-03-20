class UserMailer < ApplicationMailer
  default from: "info@theofilosvenardos.com"

  def contact_form(email, name, phone, message)
    @email = email
    @name = name
    @phone = phone
    @message = message
    mail( from: email,
          to: "thvenardos@gmail.com",
          subject: "A new contact from #{name}")
  end
end
