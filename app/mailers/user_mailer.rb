class UserMailer < ApplicationMailer
  default from: "slimfred37@gmail.com"
  @appname = "Kath's Blog"

    def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'slimfred37@gmail.com',
           subject: "A new contact form message from #{name}")
    end

    def welcome(user)
        mail( :to => user.email,
              :subject => "Welcome to #{@appname}!")
    end

    def new_article(user)
      mail( :to => user.email,
            :subject => "New article on #{@appname}!")

end
