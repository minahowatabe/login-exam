class ContactMailer < ApplicationMailer
def contact_mail(user,blog)
  @title = blog.title
  # @user = user   
  # mail( 
  #   to: @user.email, 
  #   subject: "you just posted!"
  # )
  mail to: user.email, subject: "you just posted!"

end
end
