# Responsible for the messages printed out to the user
class TextHandler
  def print_confirmation_message(entry)
    "#{entry.quantity} x #{entry.item.name}/s added to your basket"\
    " at #{entry.item.price} each"
  end
end
