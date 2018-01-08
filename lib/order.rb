# Order class
class Order
  def initialize
    @menu = Menu.new
  end

  def select_item(item_num)
    @menu.display_items[item_num]
  end
end
