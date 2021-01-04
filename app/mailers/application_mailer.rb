class ApplicationMailer < ActionMailer::Base
  default from: 'bbq@time-to-bbq.herokuapp.com'

  layout 'mailer'
end
