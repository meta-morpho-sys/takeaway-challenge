require 'menu'

describe Menu do
  subject(:menu) { Menu.new 'Sweets and Drinks' }
  ASSETS_DIR = File.dirname(__FILE__) + '/../assets/'

  def load_file(filename)
    File.readlines(ASSETS_DIR + filename).map(&:strip)
  end

  it 'prints lists of dishes and prices' do
    items = load_file('sweets_and_hot_drinks.txt')
    expect(menu.display_items).to eq items
  end
end
