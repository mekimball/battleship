class Board
attr_reader :cells, :rows, :colums

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
    @cells.key?(cell)
  end

  def valid_placement?(ship,coordinates)
    ship.length == coordinates.length

  end

  #check if letters are the same
  #check if numebers are the same
  #check if numbers are consecutive
  #check if letters are consecutive
end
