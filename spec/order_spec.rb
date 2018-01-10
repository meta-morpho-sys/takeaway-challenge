require 'order'

describe Order do
  let(:order) { Order.new }

  it 'lets you select an item from the menu' do
    expect(order.select_item('barbecue-menu', 'Ribs'))
      .to eq('name' => 'Ribs', 'price' => 2.50)
  end


  xit 'lets you order a quantity of a chosen item' do
    order.place_order(0, 2)
    expect(order.basket).to eq ['Cake, 5.60', 'Cake, 5.60']
  end
end
