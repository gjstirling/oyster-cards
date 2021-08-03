require "oystercard"
require "station"

describe Oystercard do 
  subject(:oystercard) { described_class.new(10) }
  let(:entry_station) { double(Station.new) }
  let(:exit_station) { double(Station.new) }
  it { is_expected.to respond_to(:top_up).with(1).argument } 
  it { expect(subject.balance).to eq(10) }


  describe '#top_up' do
    it "adds money to card" do
     expect(subject.top_up(5)).to eq(15)
    end
    it "there is a maximum balance" do
      expect { Oystercard.new(LIMIT).top_up(5) }.to raise_error "Error: Cannot exceed max balance of 90"
    end
  end

  describe 'touch_in' do 
    it "Card needs minimum balance to touch_in" do 
      expect { Oystercard.new(0).touch_in(entry_station) }.to raise_error "Insufficient funds to travel"
    end

    it "should record entry station" do
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end
  end 

  describe 'touch_out' do 
    it "should deduct fare from balance" do
      expect {subject.touch_out(5, exit_station)}.to change{subject.balance}.by(-5)
    end  

    it "should empty entry station" do
      subject.touch_out(5, exit_station)
      expect(subject.entry_station).to eq(nil)
    end

    it "Checks card has recorded a single completed journey" do 
      subject.touch_out(5, exit_station)
      expect(subject.journey_history).to eq([{subject.entry_station => exit_station}])
    end
  end
  
  describe 'in_journey?' do 
    it "Checks if card is in transit" do 
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq(true)
    end
  end

  it "@journey_history has set default attribute" do 
    expect(subject.journey_history).to eq([])
  end

end