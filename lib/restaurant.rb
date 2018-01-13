# Handles sending of messages with Twillio
class Takeaway

  def complete_order(total_price)
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
                        .messages.create(
                          from: ENV['TWILIO_PHONE'],
                          to: ENV['TWILIO_DESTINATION_PHONE'],
                          body: message
                        )
  end

end