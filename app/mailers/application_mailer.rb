class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILJET_SENDER']
  # default from: 'bbq@time-to-bbq.herokuapp.com'

  layout 'mailer'
end
