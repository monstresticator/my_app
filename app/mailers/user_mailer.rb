class UserMailer < ApplicationMailer
  default from: "j.mircevska@yahoo.com"

  def contact_form(email, name, message)
    @message = message
      mail(:from => email,
        :to => 'j.mircevska@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end


end
