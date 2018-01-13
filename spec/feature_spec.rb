require 'restaurant'
require 'order'

describe 'Using the app' do
  let(:fat_duck) { Restaurant.new }
  let(:order) { Order.new }

  xit 'lets you choose a menu' do
    items = <<~MENU
      Ribs at £2.5
      Salad at £5.0
    MENU
    fat_duck.display_menus
    expect(fat_duck.choose_menu('barbecue')).to output(items).to_stdout
  end

  xit 'lets you make an order' do

  end

  xit 'sends a confirmation of the order' do

  end
end
