require './lib/ship'

class Cell
attr_reader :coordinate, :ship, :fire

  def initialize(coordinate)
    @coordinate = coordinate
    @fire= false
  end
  def place_ship(ship)
    @ship = ship
  end

  def empty?
     @ship == nil
  end

   def fire_upon
      if empty? == false
        @ship.hit
        @fire = true
      else
        @fire = true
      end
    end

  def fired_upon?
    @fire
  end

  def render(reveal = false)
    if reveal == true && !empty? && !fired_upon?
      "S"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "H"
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && !empty? && @ship.sunk?
      "X"
    else
      "."
    end
  end
end
