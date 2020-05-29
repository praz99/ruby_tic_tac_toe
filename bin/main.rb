#!/usr/bin/env ruby
require_relative '../lib/name_check.rb'
require_relative '../lib/board.rb'

# Welcome Message and player name input.
puts ".....Welcome to Tic-Tac_Toe!.....\n\n"
puts 'Please enter your name Player_one:'
player_one = gets.chomp.capitalize
puts "\n"

valid_name = NameCheck.new
until valid_name.name_given?(player_one)
  puts 'Name cannot be empty. Please input a name.'
  player_one = gets.chomp.capitalize
end

puts 'Please enter your name Player_two:'
player_two = gets.chomp.capitalize
puts "\n"
check = true
while check
  if !valid_name.name_given?(player_two)
    puts 'Name cannot be empty. Please input a name.'
    player_two = gets.chomp.capitalize
  elsif valid_name.name_repeated?(player_one, player_two)
    puts 'The name has been repeated, please select a different name player_two.'
    player_two = gets.chomp.capitalize
  else
    check = false
  end
end

# Player input symbol selection.
select_one = ''
until select_one.upcase == 'X' || select_one == 'O'
  puts "#{player_one}, please select 'X' or 'O'"
  select_one = gets.chomp.upcase
end

select_two = select_one == 'X' ? 'O' : 'X'

puts "#{player_one} has selected #{select_one}."
puts "Therefore #{player_two} will use #{select_two}."
puts ''
puts 'The board is displayed'

board = Board.new
puts board.display_board

def find_winner
  puts 'check win condition.'
  puts 'check draw condition'
  puts 'If win condition or draw, end game else continue game.'
end

def valid_move?(move)
  (1..9).include?(move)
end

current_player = player_one
game = true

while game
  puts ''
  if current_player == player_one
    puts "#{player_one}, please enter your move."
    input = gets.chomp.to_i # Current player's input.
    until valid_move?(input)
      puts 'Invalid move, please choose another move.'
      input = gets.chomp.to_i
    end
    if board.update_board(input, select_one)
      puts board.display_board
      current_player = player_two
    else
      puts "Error"
    end
  else
    puts "#{player_two}, please enter your move."
    input = gets.chomp.to_i # Current player's input.
    until valid_move?(input)
      puts 'Invalid move, please choose another move.'
      input = gets.chomp.to_i
    end
    board.update_board(input, select_two)
    puts board.display_board
    current_player = player_one
  end
  # game = false if find_winner
end

puts '.....GAME OVER.....'
