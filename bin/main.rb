#!/usr/bin/env ruby

require_relative '../lib/game.rb'
require_relative '../lib/name_check.rb'

puts "\n.....Welcome to Tic-Tac_Toe!.....\n\n"

puts '  ---+--+--+---
  #  |  #  |  #
  ---+--+--+---
  #  |  #  |  #
  ---+--+--+---
  #  |  #  |  #
  ---+--+--+---
'

puts "This is game of 'X' and 'O'\n\n"

play = true

while play
  game = Game.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  name_check = NameCheck.new
  puts "Please enter your name Player One:\n"
  player_one = gets.chomp.capitalize

  until name_check.name_given?(player_one)
    puts "Name cannot be empty.Please enter your name!\n\n"
    player_one = gets.chomp.capitalize
  end

  puts "\nPlease select 'X' or 'O'"
  select_one = gets.chomp.upcase

  until %w[X O].include?(select_one)
    puts "\nPlease select either 'X' or 'O'"
    select_one = gets.chomp.upcase
  end

  game.player1_name = player_one
  game.player1_select = select_one

  puts "#{player_one} has choosen #{select_one}\n\n"

  puts "\nPlease enter your name Player Two:"
  player_two = gets.chomp.capitalize

  until name_check.name_given?(player_two)
    puts "Name cannot be empty.Please enter your name!\n\n"
    player_two = gets.chomp.capitalize
  end
  while name_check.name_repeated?(player_one, player_two)
    puts "This name has been repeated. Please enter a different name Player two.\n\n"
    player_two = gets.chomp.capitalize
  end

  select_two = select_one == 'X' ? 'O' : 'X'
  puts "\n#{player_one} is using #{select_one}.\n\n"
  puts "Therefore #{player_two} will use #{select_two}."

  game.player2_name = player_two
  game.player2_select = select_two

  game_is_on = true

  puts "\nDisplaying Board\n\n"
  puts '    ---+--+--+---
    1  |  2  |  3
    ---+--+--+---
    4  |  5  |  6
    ---+--+--+---
    7  |  8  |  9
    ---+--+--+---
  '
  i = 0

  while game_is_on
    game.current_player(i)
    puts "\n#{game.name_current_player}(#{game.current_player_letter}) please make a move from 1 to 9 "
    move = gets.chomp
    until game.valid_move?(move)
      puts "\nError, input invalid. #{game.name_current_player} Please try again"
      move = gets.chomp
    end

    board = game.add_to_board(move.to_i)
    puts "\n      ---+--+--+---
      #{board[0]}  |  #{board[1]}  |  #{board[2]}
      ---+--+--+---
      #{board[3]}  |  #{board[4]}  |  #{board[5]}
      ---+--+--+---
      #{board[6]}  |  #{board[7]}  |  #{board[8]}
      ---+--+--+---
    "
    win = game.win?
    if win
      puts "\n#{game.name_current_player} has won the game!"
      game_is_on = false
    end

    draw = game.no_win?
    if draw && !win
      puts "\nIt's a Tie!!!"
      game_is_on = false
    end
    i += 1
    play = false
  end

  puts "\nWould you like to start again?"
  puts "\nType 'y' for Yes or 'n' for No"
  choice = gets.chomp.downcase
  until %w[y n].include?(choice)
    puts "\nPlease enter 'y' to continue playing or 'n' to exit game."
    choice = gets.chomp.downcase
  end
  while choice
    play = choice == 'y'
    puts "\nThankyou for playing tic-tac-toe." if play == false
    break
  end
end
