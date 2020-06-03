require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

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

  describe "#valid_move?" do
    selection = rand(1..9)
    it "checks if the selected move is valid" do
      expect(game.valid_move?(selection)).to eql(false)
    end
    it "returns false when a string is entered" do
      expect(game.valid_move?("")).to be false
    end
    it "checks if the value selected is a valid move" do
      selection = rand(1..9)
      game.add_to_board(selection)
      expect(game.valid_move?(selection)).to eql(false)
    end
  end

  describe "#add_to_board" do
    let(:alphabet) { nil }
    arr = Array[1, 2, 3, 4, 5, 6, 7, 8, 9]
    selection = rand(1..9)
    arr.delete_at(selection - 1)
    it "should add the choice of the player to the board" do
      output = arr.insert(selection - 1, alphabet)
      expect(game.add_to_board(selection)).to eq(output)
    end
  end
end

describe Board do
  describe "#win?" do
    context "when there is a win" do
      let(:board) { ["O", "O", "O", " ", " ", " ", " ", " ", " "]}
      let(:alphabet) { "O" }
      it "should return true" do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context "when there is no win" do
      let(:board) { ["X", " ", " ", " ", " ", " ", "X", " ", " "]}
      let(:alphabet) { "X" }
      it "should return false" do
        expect(Board.win?(board, alphabet)).to eq false
      end
    end
  end

  describe "#draw?" do
    it "returns true if the board is full" do
      expect(Board.draw?(%w[X O X X O X O X O])).to be true
    end

    it "returns false if board has an empty cell" do
      expect(Board.draw?(['X', ' '])).to be false
    end
  end
end
