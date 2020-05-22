#!/usr/bin/env ruby

puts "Welcome to Tic-Tac_Toe!\n\n"
puts "Please enter your name, Player1?\n"
player_1 = gets.chomp
puts "Please select X or O\n"
select_1 = gets.chomp
if select_1 == "X"
  puts "#{player_1} has selected X"
  select_2 = "O"
elsif select_1 == "O"
  puts "O"
  select_2 = "X"
else 
  puts "Please enter X or O"
end
puts "Please enter your name, Player2?\n"
player_2 = gets.chomp
puts "#{player_2} is #{select_2}"