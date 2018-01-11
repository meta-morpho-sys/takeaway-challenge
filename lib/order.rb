require_relative 'menu'

# Defining helper classes which then will be instantiated where necessary.
# Such classes are perfect for storing data.
Item = Struct.new(:name, :price)
Entry = Struct.new(:item, :quantity)

# Order class stores a collection of items
class Order
  attr_reader :basket
  def initialize
    @menu = Menu.new
    @basket = []
  end

  # Returns an Item containing the selected item and its price.
  # TODO : cope with 'Not found!'
  def select_item(menu_category, item_name)
    category = @menu.current_menu[menu_category]
    category.each do |dish|
      if dish['name'] == item_name
        item = Item.new(dish['name'], dish['price'])
        return item
      end
    end
  end

  # Returns an Array of entries
  def place_order(menu_category, item_name, quantity)
    selected_item = select_item(menu_category, item_name)
    entry = Entry.new(selected_item, quantity)
    @basket << entry
  end
end
