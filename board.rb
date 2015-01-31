## Board Class
## Unbeatable Tic Tac Toe in Ruby

class Board
  attr_accessor :squares, :select_desc, :status, :winning_combos

  def initialize
    @squares = {
      a1: "-", a2: "-", a3: "-",
      b1: "-", b2: "-", b3: "-",
      c1: "-", c2: "-", c3: "-"
    }

    @select_desc =
      "a1 | a2 | a3 \n" +
      "------------ \n" +
      "b1 | b2 | b3 \n" +
      "------------ \n" +
      "c1 | c2 | c3 \n"
  end

  def status
    "#{@squares[:a1]} | #{@squares[:a2]} | #{@squares[:a3]} \n" +
    "------------ \n" +
    "#{@squares[:b1]} | #{@squares[:b2]} | #{@squares[:b3]} \n" +
    "------------ \n" +
    "#{@squares[:c1]} | #{@squares[:c2]} | #{@squares[:c3]} \n"
  end

  def winning_combos
    [
      [:a1, :a2, :a3], # 1
      [:b1, :b2, :b3], # 2
      [:c1, :c2, :c3], # 3
      [:a1, :b1, :c1], # 4
      [:a2, :b2, :c2], # 5
      [:a3, :b3, :c3], # 6
      [:a1, :b2, :c3], # 7
      [:a3, :b2, :c1]  # 8
    ]
  end

  def change_square(position, player)
    if @squares[position] == "-" && player == :computer
      @squares[position] = "o"
    elsif @squares[position] == "-" && player == :human
      @squares[position] = "x"
    else
      return :occupied
    end
  end

end
