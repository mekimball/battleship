require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
board = Board.new
cruiser = Ship.new('Cruiser', 3)
submarine = Ship.new('Submarine', 2)

game = Game.new
game.start
