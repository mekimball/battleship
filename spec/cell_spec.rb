require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end

  it 'has coorinates' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end


  it 'can tell if cell is empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to eq(true)
  end

  it 'it is a instance of ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it 'can be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)

  end
end
