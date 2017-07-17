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

  it { is_expected.to respond_to(:order) } #.with(2).arguments }


  it 'gives a list of dishes with totals' do
    pending
    dish.order#('1, 1, 2', 15.00)
    selection = <<DISHES
1 x Burrito  £ 5.60
1 x Burrito  £ 5.60
1 x Salad    £ 3.80
Total        £ 15.00
DISHES
    expect { dish.show_selection }.to output(selection).to_stdout
  end

  it 'adds up selected items and returns that number' do
    pending
    dish.order('1, 1, 2', 15.00)
    expect(dish.sum).to eq(15.00)
  end

  it "raises error if the total differs from the customer's" do
    pending
    dish.order('1, 1, 2', 17.00)
    expect { dish.sum }.to raise_error 'Sorry! Incorrect sum.'
  end

  it 'sends a text message saying that the order was placed successfully and that it will be delivered 1 hour from now.' do
    pending
    dish.order('1, 1, 2', 15.00)
    expect(dish.confirm_order).to eq 'Thank you! Your order was placed and will be delivered before 18:52'
  end



end