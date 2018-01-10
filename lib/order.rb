require_relative 'menu'
# Order class stores a collection of items
class Order
  attr_reader :basket
  def initialize
    @menu = Menu.new
    @basket = []
  end

  # Returns a hash of hashes containing the selected item and its price.
  def select_item(menu_category, item_name)
    category = @menu.current_menu[menu_category]
    category.each do |dish|
      return dish if dish['name'] == item_name
    end
  end

  def place_order(menu_category, item_name, quantity)
    selection = select_item(menu_category, item_name)
    quantity.times { @basket << selection }
  end
end
