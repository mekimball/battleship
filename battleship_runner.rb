require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/ship'

<<<<<<< HEAD
board = Board.new
cruiser = Ship.new('cruiser', 3)
submarine = Ship.new('submarine', 2)
=======
require './lib/game'
require './lib/board'
board = Board.new
cruiser = Ship.new('Cruiser', 3)
submarine = Ship.new('Submarine', 2)

>>>>>>> 300e405f225d25d537361a79dc55ea1ef5ebb3a6
game = Game.new
game.start
