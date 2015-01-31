# PLAY unbeatable command line tic tac toe

require 'pry'
require_relative 'board'

@board = Board.new
puts "This is your board"
puts @board_description

puts "where whould you like to put your X?"


 @board.change_square(:a1, :computer)
  puts @board.squares
