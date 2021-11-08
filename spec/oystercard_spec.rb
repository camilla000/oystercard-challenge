require 'oystercard'
describe Oystercard do
  
  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it "can top up the balance" do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
  end
end
