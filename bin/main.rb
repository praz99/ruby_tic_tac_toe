#!/usr/bin/env ruby

require_relative '../lib/game.rb'
puts ".....Welcome to Tic-Tac_Toe!.....\n\n"
puts "  ---+---+---+--"
puts "  #  |  #  |  # "
puts "  ---+---+---+--"
puts "  #  |  #  |  # "
puts "  ---+---+---+--"
puts "  #  |  #  |  # "
puts "  ---+---+---+--"


puts "This is game of 'X' and 'O'\n"

play = true

while play
  game = Game.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  puts 'Please enter your name Player One:'
  player_one = gets.chomp.capitalize

  while player_one.empty?
    puts "Please enter your name!"
    player_one = gets.chomp.capitalize
  end

  puts "Select either 'X' or 'O'"
  select_one = gets.chomp.upcase

  until %w[X O].include?(select_one)
    puts "Please select 'X' or 'O'"
    letter = gets.chomp.upcase
    select_one = letter if Game.valid_letter?(letter)
  end

  game.player1_name = player_one
  game.player1_select = select_one

  puts "#{player_one} chose #{select_one}"

  puts 'Please enter your name Player Two:'
  player_two = gets.chomp.capitalize

  while player_two.empty?
    puts "Please enter your name!"
    player_two = gets.chomp.capitalize
  end

  select_two = select_one == 'X' ? 'O' : 'X'
  puts "Therefore #{player_two} will use #{select_two}."

  game.player2_name = player_two
  game.player2_select = select_two


  game_is_on = true

  puts "  ---+---+---+--"
  puts "  1  |  2  |  3 "
  puts "  ---+---+---+--"
  puts "  4  |  5  |  6 "
  puts "  ---+---+---+--"
  puts "  7  |  8  |  9 "
  puts "  ---+---+---+--"

  i = 0

  while game_is_on
    game.current_player(i)
    puts "#{game.name_current_player} please make a move from 1 to 9 "
    move = gets.chomp
    until game.valid_move?(move)
      puts "Error, input invalid. #{game.name_current_player} Please try again"
      move = gets.chomp
    end

    board = game.add_to_board(move.to_i)

    puts "  ---+---+---+--"
    puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]} "
    puts "  ---+---+---+--"
    puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]} "
    puts "  ---+---+---+--"
    puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]} "
    puts "  ---+---+---+--"

    win = game.win?

    if win
      puts "#{game.name_current_player} has won the game!"
      game_is_on = false
    end

    draw = game.no_win?
    if draw && !win
      puts "It's a Tie!!!"
      game_is_on = false
    end
    i += 1
  end

  puts "Would you like to start again?"
  puts "Type 'y' for Yes or 'n' for No"

  while choice = gets.chomp.downcase 
    if choice == 'y'
      continue = true
      break
    elsif choice == 'n'
      continue = false
      break
    else
      puts "Please, enter 'y' for Yes or 'n' for No"
      choice
    end
    choice
  end
end
