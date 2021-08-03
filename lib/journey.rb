

class Journey

attr_reader :entry_station

  def initialize()
    @entry_station = nil
  end 

  def in_journey?
    @entry_station != nil
  end
end