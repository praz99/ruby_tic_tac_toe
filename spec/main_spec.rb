require_relative '../lib/game.rb'
require_relative '../lib/name_check.rb'

describe Game do
  subject(:game) { Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }

  describe "#initialize" do
    it "should initialize the Game class" do
      expect(game.class).to eq(Game)
    end
  end

  describe "#current_player" do
    let(:player1_name) { "Marylene" }
    let(:player2_name) { "Glory" }

    context "when num is even" do
      let(:num) { 2 }
      it "checks if number given is even" do
        expect(num.even?).to eq(true)
      end

      it "should set player one name to be name of current player" do
        expect(player1_name).to eq("Marylene")
      end
    end

    context "when num is not even" do
      let(:num) { 1 }
      it "checks if number given is not even" do
        expect(num.odd?).to eq(true)
      end

      it "should set player two name to be name of current player" do
        expect(player2_name).to eq("Glory")
      end
    end
  end
end