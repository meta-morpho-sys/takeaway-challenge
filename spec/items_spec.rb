require 'items'

describe Items do
  subject(:dish) { described_class.new }
  it { is_expected.to respond_to(:see) }

  it 'prints lists of dishes and prices' do
    menu = <<DISHES
1. Burrito  £ 5.60
2. Salad    £ 3.80
DISHES
    expect { dish.see }.to output(menu).to_stdout
  end

end