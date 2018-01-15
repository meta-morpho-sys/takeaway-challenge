require 'menu'
require 'order'

ord = Order.new
ord.add_item 'sweets', 'Ice Cream', 3
p ord.total
p ord.checkout 4.5