class Board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display_board
    "           |     |
        #{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}
      _____|_____|_____
           |     |
        #{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}
      _____|_____|_____
           |     |
        #{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}
           |     |"
  end

  def update_board(num, sym)
    i = 0
    while i < 3
      j = 0
      while j < 3
        if @board[i][j] == num
          @board[i][j] = sym
          return true
        end
        j += 1
      end
      i += 1
    end
    return false
  end
end