require 'yaml'

# Displays menus, takes and confirms orders
class Menu
  ASSETS_DIR = File.dirname(__FILE__) + '/../assets/'
  FILE_NAME = ASSETS_DIR + 'menu_example.yaml'.freeze
  attr_reader :current_menu

  def initialize
    @current_menu = YAML.safe_load(File.open(FILE_NAME))
  end

  def display_items(menu_category)
    puts 'Take a look at our menu 🦀'
    @current_menu[menu_category].each do |dish|
      puts "#{dish['name']} at £#{dish['price']}"
    end
  end
end
