require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
class Game

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)
    @player_board = Board.new
    @computer_board = Board.new
    @all_ships = [
      {name:"Cruiser", len:3},
      {name:"Submarine", len:2}
    ]

  end
  def start
    puts welcome
    puts user_input
  end
  def welcome
    "Welcome to BATTLESHIP \n" +
    "Press P to play. Press any other key to quit"
  end
  def start_game


    for ship_details in @all_ships do
      ship = Ship.new(ship_details[:name], ship_details[:len])
      coordinates = []
      ship.length.times do
        puts "Choose your coordinate for #{ship.name}"
        cell_test = gets.chomp.capitalize
        until @player_board.valid_coordinate?(cell_test)
          puts "Sorry try a valid coordinate"
          cell_test = gets.chomp.capitalize
        end
        coordinates << cell_test
        puts @player_board.render(true)
      end
        unless @player_board.valid_placement?(ship, coordinates)
          puts "What is wrong with you? Try again"
          start_game
        end
        @player_board.place(ship, coordinates)
    end
      comp_placement
      20.times do
        turn
        puts "Your Board"
        puts @player_board.render(true)
        puts "Computer Board"
        puts @computer_board.render
        end_game
      end
  end

  def comp_placement
    potential = @computer_board.cells.keys
    samples = potential.sample(2)
    until @computer_board.valid_placement?(@submarine, samples) do
      samples = potential.sample(2)
    end
    @computer_board.place(@submarine, samples)
    @potential = @computer_board.cells.keys
    samples = potential.sample(3)
    until @computer_board.valid_placement?(@cruiser, samples) do
      samples = potential.sample(3)
    end
    @computer_board.place(@cruiser, samples)
    puts "Your Board"
    puts @player_board.render(true)
    puts "Computer Board"
    puts @computer_board.render
  end

  def turn
    puts "Choose a coordinate to fire upon."
    @shot = gets.chomp.capitalize
      until @player_board.valid_coordinate?(@shot) && !@computer_board.cells[@shot].fire
        puts "Sorry that is not a valid coordinate, please try again"
        @shot = gets.chomp.capitalize
      end
    @computer_board.cells[@shot].fire_upon
      @player_board.cells[@potential.shuffle.shift].fire_upon
      results(@computer_board)
      results(@player_board)
  end

  def end_game
    if @submarine.health + @cruiser.health == 0
      puts "Congrats you won!"
      game = Game.new
      game.start
    end
  end


  def results(board)
    if board.cells[@shot].render(true) == "X"
      puts "Ship has been sunk"
    elsif board.cells[@shot].render(true) == "H"
      puts "Has hit a ship"
    elsif board.cells[@shot].render(true) == "M"
      puts "Your shot missed"
    end
  end

  def user_input
    input = gets.chomp
    if input == "p"
      start_game
    elsif input != "p"
      exit
    end
  end
end
