DEFAULT_BALANCE = 0
LIMIT = 90
MINIMUM_BALANCE = 1

class Oystercard

attr_reader :balance, :entry_station
  
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{LIMIT}" if ((@balance + money) > LIMIT)
    
    @balance += money
  end 

  def touch_in(entry_station)
    @entry_station = entry_station
    raise "Insufficient funds to travel" unless @balance >= MINIMUM_BALANCE
  end 

  def touch_out(fare)
    @entry_station = nil
    deduct(fare)
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(money)
    @balance -= money
  end

end
