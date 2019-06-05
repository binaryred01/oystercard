require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'checks if an oystercard is topped up' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'can top up the oystercard balance' do
    #expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    expect(subject.top_up(1)).to eq(1)
  end

  it 'gives an error if the maximum balance is exceeded' do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    #expect(subject.top_up(1)).to raise_error "Maximum balance exceeded: #{Oystercard::MAXIMUM_BALANCE}."
    expect { subject.top_up(1) }.to raise_error("Maximum balance exceeded: #{Oystercard::MAXIMUM_BALANCE}.")
  end

#  it 'deducts fare from your card' do
#    card = Oystercard.new
#    card.top_up(20)
#    expect(card.deduct(3)).to eq (17)
#  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it "can touch in" do
    subject.top_up(5)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "raises an error when below insufficient balance" do
    subject.top_up(5)
    #expect { subject.touch_in }.to raise_error "Error: insufficient balance"
    expect{ raise RuntimeError, "Error: insufficient balance"}.to raise_error("Error: insufficient balance")
  end

  it 'charges the card when touch out' do
    subject.top_up(5)
    subject.touch_in
    expect { subject.touch_out}.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

end
