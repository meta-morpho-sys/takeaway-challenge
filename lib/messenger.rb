require 'twilio-ruby'

# Docs
module IMessenger
  def send_message(_message)
    raise 'Not Implemented'
  end
end

# Implements the Messenger interface
class TwilioMessenger
  include IMessenger

  def initialize
    @to = ENV['TWILIO_DESTINATION_PHONE']
    @from = ENV['TWILIO_PHONE_NUM']
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message(message)
    @client.messages.create(
      from: @from,
      to: @to,
      body: message
    )
    puts "Message #{message} sent."
  end
end
