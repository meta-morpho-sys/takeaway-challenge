# Displays menus, takes and confirms orders
class Menu
  ASSETS_DIR = File.dirname(__FILE__) + '/../assets/'
  attr_reader :name

  def initialize(name)
    @name = name
    @selected_items = []
  end

  def display_items(filename = ASSETS_DIR + 'sweets_and_hot_drinks.txt')
    File.read(filename)
  end
end
