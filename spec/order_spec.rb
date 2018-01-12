require 'order'

describe Order do
  let(:order) { Order.new }

  it 'lets you select an item from the menu' do
    expect(order.select_item('barbecue', 'Ribs'))
      .to eq(Item.new('Ribs', 2.50))
  end

  it 'raises an exception if an item is not found' do
    expect { order.select_item('drinks', 'Ribs') }
      .to raise_exception 'Item not found in this menu.'
  end

  it 'lets you order a quantity of a chosen item' do
    item = Item.new('Ice Cream', 1.5)
    QUANTITY = 2
    entry = Entry.new(item, QUANTITY)
    basket = [entry]
    order.add_item('sweets', 'Ice Cream', QUANTITY)
    expect(order.basket).to eq basket
  end

  it 'gives the total of one entry' do
    order.add_item('drinks', 'Apple Juice', 2)
    expect(order.total).to eq 4.60
  end

  it 'gives the total of more entries' do
    order.add_item('drinks', 'Apple Juice', 2)
    order.add_item('barbecue', 'Ribs', 2)
    expect(order.total).to eq 9.60
  end
end
