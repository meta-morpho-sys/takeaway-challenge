require_relative 'menu'
# Order class
class Order
  attr_reader :basket, :selected_item
  def initialize
    @menu = Menu.new
    @basket = []
  end

  def select_item(menu_category, item)
    category = @menu.current_menu[menu_category]
    selection = category.each do |dish|
      return dish if dish['name'] == item
    end
    p @selected_item = selection
  end
end
