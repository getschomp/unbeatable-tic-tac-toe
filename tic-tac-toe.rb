## Playing logic
## Unbeatable Tic Tac Toe in Ruby

require 'pry'
require_relative 'board'

@board = Board.new
puts "Use these combinations to select from the board"
puts @board.select_desc

def player_goes
  puts "where whould you like to put your X?"
  position = gets.chomp.to_sym
  @board.change_square(position, :human)
  puts @board.status
end

def check_win
  # don't need to write this because they will never win!! >:P
  #  will write for testing purposes
  results = []
  @board.winning_combos.each do |combo|
    combo.each do |square_key|
      results << @board.squares[square_key]
      if results == ["x", "x", "x"]
        return true
        break
      elsif results == ["o", "o", "o"]
        return false
        break
      end
    end
    results = []
  end
end

loop do
  player_goes
  #cumputer_goes
  if check_win == true
    puts "you win"
    break
  elsif check_win == false
    puts "you loose"
    break
  end
end


