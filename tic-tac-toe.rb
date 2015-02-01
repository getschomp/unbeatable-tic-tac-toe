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
      if check_results != nil
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
        puts "thats not a position on the board" +
        write_directions
        player_goes
      end
    end
  end

  def computer_goes
    position = @board.squares.keys.sample
    if @board.occupied?(position)
      puts "that position is occupied"
      computer_goes
    else
      puts "The computer put an \"o\" on #{position}"
      @board.change_square(position, :computer)
      puts @board.status
  end

end



@game = Game.new
@game.play_game
