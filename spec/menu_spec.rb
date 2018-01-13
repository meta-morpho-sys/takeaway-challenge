require 'menu'

describe Menu do
  subject(:menu) { Menu.new }

  it 'prints lists of dishes and prices for a category of menu' do
    items = <<~MENU
      Ribs at £2.5
      Salad at £5.0
    MENU
    expect { menu.display_items('barbecue') }.to output(items).to_stdout
  end
end
