require "oystercard"

describe Oystercard do 
  subject(:oystercard) { described_class.new }
  it { is_expected.to respond_to(:top_up).with(1).argument } 
  it { expect(subject.balance).to eq(0) }


  describe '#top_up' do
    it "adds money to card" do
     expect(subject.top_up(5)).to eq(5)
    end
  end

end