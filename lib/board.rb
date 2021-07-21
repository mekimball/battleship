require './lib/cell'
require './lib/ship'

class Board

  attr_reader :cells,:rows, :colums, :interior


  def initialize
    @cells = {}
    create_cell
  end

  def create_cell
    rows = ("A".."D")
    columns = ("1".."4")
    rows.each do |letter|
      columns.each do |number|
      coordinates = letter+number
      @cells[coordinates] = Cell.new(coordinates)
      end
    end
  end

  def valid_coordinate?(coordinate)
   @cells.keys.include?(coordinate)
  end



  def valid_cells?(coordinates)
    coordinates.all? {|coordinate| valid_coordinate?(coordinate)}
  end

  def letters_consecutive?(coordinates)
    letters =coordinates.map {|coordinate| coordinate[0]}
      letters == (letters.first..letters.last).to_a
  end


  def numbers_consecutive?(coordinates)
    numbers = coordinates.map {|coordinate| coordinate[1]}
      numbers == (numbers.first..numbers.last).to_a
  end

   def consecutive_coordinates?(coordinates)
     if coordinates.all? { |coordinate| coordinate[0] == coordinates.first[0]}
       numbers_consecutive?(coordinates)
     elsif coordinates.all? { |coordinate| coordinate[1] == coordinates.last[1]}
       letters_consecutive?(coordinates)
     else
       false
     end
   end

   def no(coordinates)
     coordinates.all? {|coordinate| @cells[coordinate].empty?}
   end



  def valid_placement?(ship,coordinates)
    valid_size?(ship,coordinates) && consecutive_coordinates?(coordinates) && valid_cells?(coordinates) && no(coordinates)
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
    @cells[coordinate].place_ship(ship)
    end
  end



  def valid_size?(ship,coordinates)
    ship.length == coordinates.length
  end

  def render(arg = false)
     board = "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"

    board_2 = "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
    "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
    "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
    "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"

    if arg == true
      board_2
    else
      board
    end
  end
end
