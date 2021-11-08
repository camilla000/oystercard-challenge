class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
    @in_journey = false
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise 'Insufficient balance to touch in' if balance < MINIMUM_FARE

    record_journey(station)
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

  private

  def record_journey(station)
    @entry_station = station
  end
end
