class NameCheck
  def name_given?(player)
    player.split('').any?(/\w/) ? true : false
  end

  def name_repeated?(player_one, player_two)
    player_one == player_two ? true : false
  end
end