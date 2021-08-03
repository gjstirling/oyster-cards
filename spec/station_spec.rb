require "station"

describe Station do
  it "should have a zone attribute" do
    expect(subject.zone).to be_between(1,5).inclusive
  end

  it "should have a name attribute" do
    expect(subject.name).to be_between(0.0,1.0).inclusive
  end
end