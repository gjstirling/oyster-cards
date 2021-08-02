class Oystercard

attr_reader :balance
attr_reader :limit


  def initialize(balance = 0)
    @balance = balance
    @limit = 90
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{limit}" if ((@balance + money) > @limit)
    
    @balance += money
  end 

  def deduct(money)
    @balance -= money
  end

end
