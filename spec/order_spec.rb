require 'order'
require 'timecop'

describe Order do
  let(:order) { Order.new }

  it 'lets you select an item from the menu' do
    expect(order.select_item('barbecue', 'Ribs'))
      .to eq(Item.new('Ribs', Money.new(250, 'GBP')))
  end

  it 'raises an exception if an item is not found' do
    expect { order.select_item('drinks', 'Ribs') }
      .to raise_exception 'Item not found in this menu.'
  end

  it 'lets you order a quantity of a chosen item' do
    item = Item.new('Ice Cream', Money.new(150, 'GBP'))
    QUANTITY = 2
    entry = Entry.new(item, QUANTITY)
    basket = [entry]
    order.add_item('sweets', 'Ice Cream', QUANTITY)
    expect(order.basket).to eq basket
    p basket
  end

  it 'gives the total of one entry' do
    order.add_item('drinks', 'Apple Juice', 2)
    expect(order.total).to eq Money.new(460, 'GBP')
  end

  it 'gives the total of more entries' do
    order.add_item('drinks', 'Apple Juice', 2)
    order.add_item('barbecue', 'Ribs', 2)
    expect(order.total).to eq Money.new(960, 'GBP')
  end

  it 'checks that the total given to the customer is correct' do
    order.add_item('drinks', 'Apple Juice', 2)
    order.add_item('barbecue', 'Ribs', 2)
    expect { order.checkout(Money.new(550, 'GBP')) }
      .to raise_exception 'incorrect price'
  end

  # Stubbing Twilio
  it 'sends a payment confirmation text message' do
    frozen_time = Timecop.freeze(Time.now)
    message = 'Thank you! Your order : £5.00 was placed and will be'\
    " delivered before #{(frozen_time + 3600).strftime('%H:%M')}."

    order.add_item('barbecue', 'Ribs', 2)
    expect(order).to receive(:send_text).with(message)
    order.checkout(Money.new(500, 'GBP'))
  end
end
