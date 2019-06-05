class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum balance exceeded: #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "Error: insufficient balance" if balance < MINIMUM_CHARGE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
