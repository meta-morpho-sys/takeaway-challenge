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
    order.add_item('sweets-menu', 'Ice Cream', QUANTITY)
    expect(order.basket).to eq basket
  end

  it 'raises an exception if an item is not found' do
    expect { order.select_item('drinks-menu', 'Ribs') }
      .to raise_exception 'Item not found in this menu.'
  end

  # it 'gives the total or the order' do
  #
  # end
end
