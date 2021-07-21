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
    "press p to play. enter to quit"
  end
  def start_game


    for ship_details in @all_ships do
      ship = Ship.new(ship_details[:name], ship_details[:len])
      # require "pry"; binding.pry
      coordinates = []
      ship.length.times do
        puts "Choose your coordinate for #{ship.name}"
        cell_test = gets.chomp.capitalize
        until @player_board.valid_coordinate?(cell_test)
          puts "Sorry try again"
          cell_test = gets.chomp.capitalize
        end
        coordinates << cell_test
      end
      unless @player_board.valid_placement?(ship, coordinates)
        puts "What the fuck is wrong with you? Try again"
        start_game
      end
      @player_board.place(ship, coordinates)

      def computer_placement
        @all_ships.each do |s|
          name, len = s
        potential = @computer_board.cells.keys
        start = potential.sample
        dir = rand(2)
        others = [xy.dup]
        (len - 1).times do
        start(rand) == start(rand).next
        others << xy.dup
      end
      puts "#{name}: #{others}"
      cells -= others
      p cells
      @computer_board.place(ship, coordinates)
    end
  end
  def comp_placement
    potential = @computer_board.cells.keys
    @samples = potential.sample(ship.length)
    until @computer_board.valid_placement?(ship, samples) do
      samples = potential.sample(ship.length)
      p @samples
  end
  @computer_board.place(ship, @samples)
  # @computer_board.comp_placement
end
      # require "pry"; binding.pry

    end






        #pick coordinates
        #pick up or down
        #move stuff into an array after it has been used or just delete
        #where does this get valdiated?
        #where does this end up placing the ship






    puts "Your Board"
    puts @player_board.render(true)
    puts "Computer Board"
    puts @computer_board.render(true)
    # require "pry"; binding.pry
    potential = @computer_board.cells.keys
    samples = potential.sample(2)
    until @computer_board.valid_placement?(@submarine, samples) do
      samples = potential.sample(2)
    end
    @computer_board.place(@submarine, samples)
    puts @computer_board.render(true)

    potential = @computer_board.cells.keys
    samples = potential.sample(3)
    until @computer_board.valid_placement?(@cruiser, samples) do
      samples = potential.sample(3)
    end
    @computer_board.place(@cruiser, samples)
    puts @computer_board.render(true)
  end


# require "pry"; binding.pry


  def user_input
    input = gets.chomp
    if input == "p"
      start_game
    elsif input != "p"
      exit
    end
    # place
  end
end
