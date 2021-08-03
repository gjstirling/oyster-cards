DEFAULT_BALANCE = 0
LIMIT = 90
MINIMUM_BALANCE = 1

class Oystercard

attr_reader :balance, :journey
  
  def initialize(balance = DEFAULT_BALANCE, journey = false)
    @balance = balance
    @journey = journey
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{LIMIT}" if ((@balance + money) > LIMIT)
    
    @balance += money
  end 

  def touch_in
    raise "Insufficient funds to travel" unless @balance >= MINIMUM_BALANCE
    @journey = true
  end 

  def touch_out(fare)
    deduct(fare)
    @journey = false
  end

  def in_journey?
    @journey
  end

  private

  def deduct(money)
    @balance -= money
  end

end
