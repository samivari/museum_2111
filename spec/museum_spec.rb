require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe do
  it 'exists' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns).to be_a(Museum)
  end

  it 'has a name' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns.name).to eq('Denver Museum of Nature and Science')
  end

  it 'has no exhibits' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns.exhibits).to eq([])
  end

  it 'has exhibits added' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    gems_and_minerals = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    dead_sea_scrolls = Exhibit.new({ name: 'Dead Sea Scrolls', cost: 10 })
    imax = Exhibit.new({ name: 'IMAX', cost: 15 })
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it 'has recommend exhibits for patrons' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    gems_and_minerals = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    dead_sea_scrolls = Exhibit.new({ name: 'Dead Sea Scrolls', cost: 10 })
    imax = Exhibit.new({ name: 'IMAX', cost: 15 })
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    patron_1 = Patron.new('Bob', 20)
    patron_1.add_interest('Dead Sea Scrolls')
    patron_1.add_interest('Gems and Minerals')

    patron_2 = Patron.new('Sally', 20)
    patron_2.add_interest('IMAX')

    expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
    expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
  end
end
