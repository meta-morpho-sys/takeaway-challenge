require 'takeaway'

describe Takeaway do
  subject(:dish) { described_class.new }
  let(:input) { double(:input) }

  it { is_expected.to respond_to(:display_menu) }

  it 'prints lists of dishes and prices' do
    items = <<DISHES
1. Burrito  £ 5.60
2. Salad    £ 3.80
3. Juice    £ 1.80
DISHES
    expect { dish.display_menu }.to output(items).to_stdout
  end

  context 'when the order is successfully passed' do

    it { is_expected.to respond_to(:order).with(1).argument }

    it "accepts user's input of selected item" do
      expect(dish.order(input)).to eq(input)
    end

    it 'gives a list of dishes and quantities' do
      expect(dish.show_selection).to eq('1 x Burrito  £ 5.60, 1 x Salad    £ 3.80')
    end

    it 'sums up the total of the order'

    it "confirms user's order"

    it 'sends a text message saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".'

    context 'when the order fails to pass'

    it 'raises error if the total is incorrect'


  end

end