require 'order'

describe Order do
  let(:order) { Order.new }

  it 'lets you select an item from the menu' do
    expect(order.select_item('barbecue-menu', 'Ribs'))
      .to eq(Item.new('Ribs', 2.50))
  end

  it 'lets you order a quantity of a chosen item' do
    item = Item.new('Ice Cream', 1.5)
    QUANTITY = 2
    entry = Entry.new(item, QUANTITY)
    basket = [entry]
    order.place_order('sweets-menu', 'Ice Cream', QUANTITY)
    expect(order.basket).to eq basket
  end


  # it 'gives the total or the order' do
  #
  # end
end
