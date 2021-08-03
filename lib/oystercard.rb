DEFAULT_BALANCE = 0
LIMIT = 90
MINIMUM_BALANCE = 1


class Oystercard

attr_reader :balance, :entry_station, :journey_history, :current_journey
  
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @journey_history = []
    @current_journey = Journey.new
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{LIMIT}" if ((@balance + money) > LIMIT)
    
    @balance += money
  end 

  def touch_in(entry_station)
    raise "Last journey incomplete" if @current_journey.in_journey?
    @current_journey.entry_station = entry_station
    raise "Insufficient funds to travel" unless @balance >= MINIMUM_BALANCE
  end 

  def touch_out(fare, exit_station)
    @journey_history.push({@entry_station => exit_station})
    @entry_station = nil
    deduct(fare)
  end

  # def in_journey?
  #   @entry_station != nil
  # end

  private

  def deduct(money)
    @balance -= money
  end

end
