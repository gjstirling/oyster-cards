require "oystercard"

describe Oystercard do 
  subject(:oystercard) { described_class.new }
  it { is_expected.to respond_to(:add_money).with(1).argument }
#  describe '#land' do
#    it "raises an error when full" do
#      subject.land (Plane.new)
#      expect { subject.land Plane.new }.to raise_error "Airport full" 
  it { expect(subject.balance).to eq(0) } 
end


