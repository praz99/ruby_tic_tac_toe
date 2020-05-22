#!/usr/bin/env ruby

# Welcome Message and player name input.
puts ".....Welcome to Tic-Tac_Toe!.....\n\n"
puts 'Please enter your name Player_one:'
player_one = gets.chomp.capitalize
puts "\n"
puts 'Please enter your name Player_two:'
player_two = gets.chomp.capitalize
puts "\n"

# Player input symbol selection.
select_one = ''
until select_one.upcase == 'X' || select_one == 'O'
  puts "#{player_one}, Please select 'X' or 'O'"
  select_one = gets.chomp.upcase
end

select_two = select_one == 'X' ? 'O' : 'X'

puts "#{player_one} has selected #{select_one}."
puts "Therefore #{player_two} will use #{select_two}."

def display_board
  puts '1 | 2 | 3'
  puts '4 | 5 | 6'
  puts '7 | 8 | 9'
  puts ''
end

def update_board(_move)
  puts 'Register move in board.'
  puts 'Update Board.'
  puts 'Display updated board.'
end

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
  if current_player == player_one
    puts "#{player_one}, please enter your move."
    input = gets.chomp.to_i # Current player's input.
    until valid_move?(input)
      puts 'Invalid move, please choose another move.'
      input = gets.chomp.to_i
    end
    current_player = player_two
  else
    puts "#{player_two}, please enter your move."
    input = gets.chomp.to_i # Current player's input.
    until valid_move?(input)
      puts 'Invalid move, please choose another move.'
      input = gets.chomp.to_i
    end
    current_player = player_one
  end
  update_board(input)
  game = false if find_winner
end

puts '.....GAME OVER.....'
