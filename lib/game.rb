require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = [Player.new('Player 1', 'X'), Player.new('Player 2', 'O')]
    @current_player = @players[0]
  end

  def play
    puts 'Welcome to Connect Four!'
    loop do
      puts "> #{@current_player.name}'s turn (#{@current_player.disc})."
      print '• Enter column number (0-6): '
      column = gets.chomp.to_i
      unless @board.drop_disc(column, @current_player.disc)
        puts '> Error: Invalid move, try again.'
        next
      end
      @board.draw
      if (winner = @board.check_winner)
        puts "> The player with '#{winner}' won the game!"
        break
      end
      if @board.check_full
        puts '> Game ended in a draw.'
        break
      end
      @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end
  end
end
