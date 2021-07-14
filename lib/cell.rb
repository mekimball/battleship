require './lib/ship'

class Cell
attr_reader :coordinate,:ship

  def initialize(coordinate)
    @coordinate = coordinate
  end
  def place_ship(ship)
    @ship = ship
  end

  def empty?
     @ship == nil
  end
end
