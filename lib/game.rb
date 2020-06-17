require_relative './board.rb'

class Game
  attr_writer :player1_name, :player2_name, :player1_select, :player2_select
  attr_reader :current_player_letter, :name_current_player, :board

  def initialize(arr = [' '] * 9)
    @board = arr
  end

  def valid_alphabet?(alphabet)
    %w[X O].include?(alphabet)
  end

  def current_player(num)
    if num.even?
      @name_current_player = @player1_name
      @current_player_letter = @player1_select
    else
      @name_current_player = @player2_name
      @current_player_letter = @player2_select
    end
  end

  def win?
    Board.win?(@board, @current_player_letter)
  end

  def no_win?
    Board.draw?(@board)
  end

  def valid_move?(move)
    location = move.to_i
    location != 0 && @board[location - 1] == ' '
  end

  def add_to_board(location)
    @board[location - 1] = @current_player_letter
    @board
  end
end
