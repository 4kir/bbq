class SendMailJob < ApplicationJob
  queue_as :default

  def perform(action)
    event = action.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [action.user&.email]

    case action
    when Comment
      all_emails.each { |mail| EventMailer.comment(event, action, mail).deliver_later }
    when Photo
      all_emails.each { |mail| EventMailer.photo(event, action, mail).deliver_later }
    when Subscription
      EventMailer.subscription(event, action).deliver_later
    end
  end
end
