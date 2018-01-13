require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text).with('Thank you for your order: £20.93')
    takeaway.complete_order(20.93)
  end
end