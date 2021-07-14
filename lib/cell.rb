require './lib/ship'

class Cell
attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
  end
  def place_ship(ship)
    @ship = ship
  end

  def empty?
     @ship == nil
  end

  def fire_upon
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render
    if !fired_upon
      "."
    else
      "M"
    end
  end

  #render likely will use if, elsif, and else statment
  #to get the desired returns
end
