require 'station'

describe Station do
  subject(:station) {described_class.new(name: "Hammersmith", zone: 1)}

  it 'has a name' do
    expect(station.name).to eq("Hammersmith")
  end

  it 'has a zone' do
    expect(station.zone).to eq(1)
  end
end