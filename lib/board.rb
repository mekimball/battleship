require './lib/cell'

class Board

attr_reader :cells,:rows, :colums

def initialize
  @cells = {}
  create_cell
end

  def create_cell
    rows =["A","B", "C", "D"]
    colums = ["1", "2", "3", "4"]
  rows.each do |letter|
    colums.each do |number|
      coordinates = letter+number
      @cells[coordinates] = Cell.new(coordinates)
    end
  end
  end

 def valid_coordinate?(cell)
   @cells.include?(cell)
 end

def valid_placement?(ship,coordinates)
  letters = coordinates.map do |coordinate|
    coordinate[0].ord
  end
  numbers = coordinates.map do |coordinate|
     coordinate[1].to_i
   end
if ship.length == coordinates.length && letters.uniq.count == 1 && numbers.each_cons(2).all? {|a,b| b == a + 1}
  true
elsif ship.length == coordinates.length && numbers.uniq.count == 1 && letters.each_cons(2).all? {|a,b| b == a + 1}
  true
else
  false
   end
end
end
