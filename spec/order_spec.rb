require 'order'

describe Order do
  let(:order) { Order.new }
  let(:menu) { double :menu, name: 'Sweets and hot drinks' }

  it 'lets you select an item from the menu' do
    # allow(menu).to receive(:display_items).and_return(['Cake, 5.60'])
    expect(order.select_item(0)).to eq 'Cake, 5.60'
  end
end
