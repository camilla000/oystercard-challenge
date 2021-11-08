class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end
 
  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount   
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @status
  end

  def touch_in
   
    @status = true
  
  end

  def touch_out
    @status = false
  end
  
end

