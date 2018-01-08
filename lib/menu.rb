# Displays menus, takes and confirms orders
class Menu
  ASSETS_DIR = File.dirname(__FILE__) + '/../assets/'
  attr_reader :name, :items

  def initialize(name = 1)
    @name = name
    @items = []
  end

  def display_items(filename = ASSETS_DIR + 'sweets_and_hot_drinks.txt')
    @items = File.readlines(filename).map(&:strip)
  end
end
