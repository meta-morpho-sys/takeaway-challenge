require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new }
  let(:menu) { double :menu }

  it 'shows you the menus' do
    todays_menu = "\"barbecue\"\n\"sweets\"\n\"drinks\"\n"
    allow(menu).to receive(:display_menus).and_return('barbecue', 'sweets', 'drinks')
    expect { restaurant.display_menus }.to output(todays_menu).to_stdout

  end

  it 'lets you choose one menu' do
    items = <<~MENU
      Ribs at £2.5
      Salad at £5.0
    MENU
    allow(menu).to receive(:display_menus).with('barbecue').and_return items
    # restaurant.display_menus
    expect { restaurant.choose_menu('barbecue') }.to output(items).to_stdout
  end

  # Stubbing Twilio
  xit 'sends a payment confirmation text message' do
    expect(restaurant).to receive(:send_text).with('Thank you for your order: £20.93')
    restaurant.complete_order(20.93)
  end
end