require_relative 'menu'
require_relative 'messenger'
require 'twilio-ruby'
require 'money'

# Defining helper classes which then will be instantiated where necessary.
# Such classes are perfect for storing data.
Item = Struct.new(:name, :price)
Entry = Struct.new(:item, :quantity)

# Order class stores a collection of items
class Order
  attr_reader :basket
  def initialize(messenger = TwilioMessenger.new)
    @messenger = messenger
    @menu = Menu.new
    @basket = []
  end

  # Returns an Item containing the selected item and its price.
  def select_item(menu_category, item_name)
    category = @menu.current_menu[menu_category]
    category.each do |dish|
      if dish['name'] == item_name
        item = Item.new(dish['name'], Money.from_amount(dish['price'], 'GBP'))
        return item
      end
    end
    raise 'Item not found on this menu.'
  end

  # Returns an array of Entries containing items
  # with relative  prices and quantities.
  def add_item(menu_category, item_name, quantity)
    selected_item = select_item(menu_category, item_name)
    entry = Entry.new(selected_item, quantity)
    @basket << entry
    p "#{entry.quantity} x #{entry.item.name}/s added to your basket"\
    " at #{entry.item.price} each"
  end

  def total
    @basket.inject(0) do |sum, entry|
      sum + (entry.item.price * entry.quantity)
    end
  end

  def checkout(total_price)
    raise 'incorrect price' unless correct_amount?(total_price)
    time = Time.new
    delivery_time = (time + 3600).strftime('%H:%M')
    send_text("Thank you! Your order : £#{total_price} was placed and will be"\
    " delivered before #{delivery_time}.")
  end

  private

  def correct_amount?(total_price)
    price_to_compare = total
    total_price == price_to_compare
  end

  def send_text(message)
    @messenger.send_message(message)
  end
end
