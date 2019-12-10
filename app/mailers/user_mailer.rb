class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def sample_email(author)
    @author = author
    mail(to: @author.email, subject: 'Sample Email')
  end
end
