class Takeaway


  ITEMS = <<DISHES
1. Burrito  £ 5.60
2. Salad    £ 3.80
3. Juice    £ 1.80
DISHES
  @selected_items = []



  def display_menu
    puts ITEMS
  end

  def order(input)
    @selected_items = input
  end

  def show_selection
    '1 x Burrito  £ 5.60, 1 x Salad    £ 3.80'
  end
end

