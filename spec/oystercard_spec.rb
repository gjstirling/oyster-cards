require "oystercard"

describe Oystercard do 
  subject(:oystercard) { described_class.new(10) }
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

  describe 'deduct' do
    it "deducts money from card" do
      expect(subject.deduct(5)).to eq(5)
    end
  end

  describe 'touch_in' do 
    it "Registering when a card instance is beginning a journey" do 
      subject.touch_in
      expect(subject.journey).to eq(true)
    end

    it "Card needs minimum balance to touch_in" do 
      expect { Oystercard.new(0).touch_in }.to raise_error "Insufficient funds to travel"
    end
  end 

  describe 'touch_out' do 
    it "Registering when a card instance is finished a journey" do 
      subject.touch_out
      expect(subject.journey).to eq(false)
    end
  end  
  
  describe 'in_journey?' do 
    it "Checks if card is in transit" do 
      expect(Oystercard.new(10, true).in_journey?).to eq(true)
    end
  end
end