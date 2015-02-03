## Playing logic
## Unbeatable Tic Tac Toe in Ruby

require 'pry'
require_relative 'board'

class Game

  def play_game
    @board = Board.new
    write_directions
    loop do
      player_goes
      sleep(1)
      computer_goes
      unless check_results == nil
        puts check_results
        break
      end
    end
  end

  def write_directions
    puts "Use these combinations to select from the board:"
    puts @board.select_desc
  end

  def check_results
    results = []
    @board.winning_combos.each do |combo|
      combo.each do |square_key|
        results << @board.squares[square_key]
        if results == ["x", "x", "x"]
          return "you win"
          break
        elsif results == ["o", "o", "o"]
          return "you loose"
          break
        end
      end
      results = []
    end
    check_draw
  end

  def check_draw
    unless @board.squares.has_value?("-")
      return "draw"
    end
  end

  def player_goes
    puts "where whould you like to put your X?"
    position = gets.chomp.to_sym
    if @board.squares.has_key?(position)
      @board.change_square(position, :human)
      puts @board.status
    elsif @board.occupied?(position)
      puts "that position is occupied"
      write_directions
      player_goes
    else
      puts "thats not a position on the board"
      write_directions
      player_goes
    end
  end

 def block_or_win(x_or_o)
    results = []
    position = nil
    @board.winning_combos.each do |combo|
      combo.each do |square|
        results << @board.squares[square]
      end
    end
    results = results.each_slice(3).to_a
    results.each do |result|
      if result == [x_or_o, x_or_o, "-"]
        position = [2]
      elsif result == [x_or_o, "-", x_or_o]
        postion = combo[1]
      elsif result == ["-", x_or_o, x_or_o]
        position = combo[0]
      end
    end
    position
  end

  def block_or_win(x_o)
    position = nil
    results = []
    @board.winning_combos.each do |combo|
      combo.each do |square_key|
        results << @board.squares[square_key]
        if results == [x_o, x_o, "-"]
          position = combo[2]
        elsif results == [x_o, "-", x_o]
          position = combo[1]
        elsif results == ["-", x_o, x_o]
          position = combo[0]
        end
      end
      results = []
    end
    position
  end

  def play_win
    block_or_win("o")
  end

  def play_block
    block_or_win("x")
  end

  def random
    @board.squares.key.sample
  end

  def computer_goes
    position = play_win
    if position == nil then position = play_block end
    if position == nil then position = random end
    if @board.occupied?(position)
      puts "the computer choose an occupied square"
      computer_goes
     else
      @board.change_square(position, :computer)
      puts @board.status
    end
  end
end
@game = Game.new
@game.play_game
