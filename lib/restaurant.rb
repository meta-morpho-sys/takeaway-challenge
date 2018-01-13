require 'menu'
# Shows menu, makes orders and handles sending of confirmation
# messages with Twilio
class Restaurant
  def initialize
    @menu = Menu.new
  end

  # Displays only the categories(titles) of existing menus.
  def display_menus
    @menu.current_menu.each_key do |category|
      p category
    end
  end

  # Displays the details of the chosen menu category.
  def choose_menu(category)
    @menu.display_items(category)
  end

  def complete_order(total_price)
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
                             ENV['TWILIO_AUTH_TOKEN'])
                        .messages.create(
                          from: ENV['TWILIO_PHONE'],
                          to: ENV['TWILIO_DESTINATION_PHONE'],
                          body: message
                        )
  end

end