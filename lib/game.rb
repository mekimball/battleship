class Game

  def initialize

  end
  def start
    puts welcome
    puts user_input
  end
  def welcome
    "Welcome to BATTLESHIP \n" +
    "press p to play. enter to quit"

  end
  def user_input
    input = gets.chomp
    if input == "p"
      start_game
    elsif input == "exit"
      exit
    end
  end
end
