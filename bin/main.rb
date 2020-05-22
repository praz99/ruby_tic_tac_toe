#!/usr/bin/env ruby

puts "Welcome to Tic-Tac_Toe!\n\n"
puts "Please enter your name, Player1?\n"
player_1 = gets.chomp
puts "Please select X or O\n"
select_1 = gets.chomp
if select_1 == "X"
  select_2 = "O"
elsif select_1 == "O"
  select_2 = "X"
else 
  puts "Please enter X or O"
end
puts "#{player_1} has selected #{select_1}"
puts "Please enter your name, Player2?\n"
player_2 = gets.chomp
puts "#{player_2} is #{select_2}"


def display_board
  board = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
end

current_player = player_1

def player_move
  puts "#{current_player} Please choose your move."
  move = gets.chomp.to_i

end

def update_board

end

def find_winner

end

display_board