require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/name_check'

describe Game do
  subject(:game) { Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }

  describe "#initialize" do
    it "should initialize the Game class"
  end
end