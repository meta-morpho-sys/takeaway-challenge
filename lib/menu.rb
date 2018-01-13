require 'yaml'

# Displays menus, takes and confirms orders
class Menu
  ASSETS_DIR = File.dirname(__FILE__) + '/../assets/'
  FILE_NAME = ASSETS_DIR + 'menu_example.yaml'.freeze
  attr_reader :current_menu

  def initialize
    @current_menu = YAML.safe_load(File.open(FILE_NAME))
  end

  # TODO: Find a better solution to the underscore of the variable.
  # The underscore serves for the purposes of Restaurant#display_menus
  def display_items(_menu_category)
    @current_menu[_menu_category].each do |dish|
      puts "#{dish['name']} at £#{dish['price']}"
    end
  end
end
