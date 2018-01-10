require 'order'

describe Order do
  let(:order) { Order.new }

  it 'lets you select an item from the menu' do
    expect(order.select_item('barbecue-menu', 'Ribs'))
      .to eq('name' => 'Ribs', 'price' => 2.50)
  end

  it 'lets you order a quantity of a chosen item' do
    items_in_basket = { 'name' => 'Ice Cream', 'price' => 1.5 },
                      { 'name' => 'Ice Cream', 'price' => 1.5 }
    order.place_order('sweets-menu', 'Ice Cream', 2)
    expect(order.basket).to eq items_in_basket
  end
end
