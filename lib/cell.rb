require './lib/ship'

class Cell
attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end
  def ship
    @ship = Ship.new

  end
  def empty?
     @ship == nil
    #   true
    # else
    #   false

  end
end
