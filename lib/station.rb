class Station
  attr_reader :name, :zone
  
  def initialize
    @name = rand
    @zone = rand(1..5)
  end
end