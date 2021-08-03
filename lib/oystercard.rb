class Oystercard

attr_reader :balance, :limit, :journey
  
  def initialize(balance = 0, journey = false)
    @balance = balance
    @limit = 90
    @journey = journey
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{limit}" if ((@balance + money) > @limit)
    
    @balance += money
  end 

  def deduct(money)
    @balance -= money
  end

  def touch_in
    raise "Insufficient funds to travel" unless @balance >= 1
    @journey = true
  end 

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

end
