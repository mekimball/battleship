require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  it 'has coorinates' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
    # p cell.ship
  end


  it 'can tell if cell is empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  it 'it is a instance of ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    expect(cell.ship).to eq(cruiser)
  end

end
