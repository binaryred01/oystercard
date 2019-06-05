class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90

  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(amount)
    raise "Maximum balance exceeded: #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Error: insufficient balance" if balance < MINIMUM_CHARGE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end


  private

   def deduct(amount)
    @balance -= amount
  end

end
