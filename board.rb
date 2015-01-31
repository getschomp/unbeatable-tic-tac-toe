## Board Class
## Unbeatable Tic Tac Toe in Ruby

class Board
  attr_accessor :board, :board_description

  def initialize
    @board = {
      a1: "-", a2: "-", a3: "-",
      b1: "-", b2: "-", b3: "-",
      c1: "-", c2: "-", c3: "-"
    }

    @board_description = "a1 | a2 | a3
      ------------
      b1 | b2 | b3
      ------------
      c1 | c2 | c3"
  end

  def winning_combinations
    @combos = [
      [:a1, :a2, :a3], # 1
      [:b1, :b2, :b3], # 2
      [:c1, :c2, :c3], # 3
      [:a1, :b1, :c1], # 4
      [:a2, :b2, :c2], # 5
      [:a3, :b3, :c3], # 6
      [:a1, :b2, :c3], # 7
      [:a1, :b2, :c3]  # 8
    ]
  end

  def change_square(position, player)
    binding.pry
    if @board[position] == "-" && player == :computer
      @board[position] = "x"
    elsif @board[position] == "-" && player == :human
      @board[position] = "o"
    else
      return :occupied
    end
  end
end