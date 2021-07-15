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

  it 'can show us what has happened to a cell' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
    cell_2.place_ship(cruiser)
    cell_2.render
    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    # cruiser.hit
    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end


end
