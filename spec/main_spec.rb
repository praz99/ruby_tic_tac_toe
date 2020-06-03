require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Game do
  let(:arr) { [' '] * 9 }
  subject(:game) { Game.new(arr) }

  describe '#initialize' do
    it 'should initialize the Game class' do
      expect(subject.class).to eq(Game)
      expect(subject.board).to eq arr
    end
  end

  describe '#current_player' do
    let(:player_one_name) { 'Marylene' }
    let(:player_two_name) { 'Glory' }
    let(:player_one_symbol) { 'X' }
    let(:player_two_symbol) { 'O' }

    context 'when num is even' do
      let(:num) { 2 }

      it 'checks if player one is set as the current player' do
        subject.player1_name = player_one_name
        subject.player1_select = player_one_symbol
        subject.player2_name = player_two_name
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(num.even?).to eq(true)
        expect(subject.name_current_player).to eq(player_one_name)
        expect(subject.current_player_letter).to eq(player_one_symbol)
      end
    end

    context 'when num is odd' do
      let(:num) { 3 }

      it 'checks if player two is set as the current player' do
        subject.player1_name = player_one_name
        subject.player1_select = player_one_symbol
        subject.player2_name = player_two_name
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(num.odd?).to eq(true)
        expect(subject.name_current_player).to eq(player_two_name)
        expect(subject.current_player_letter).to eq(player_two_symbol)
      end
    end
  end

  describe '#valid_move?' do
    selection = rand(1..9)
    it 'checks if the selected move is valid' do
      expect(subject.valid_move?(selection)).to eql(true)
    end
    it 'returns false when a string is entered' do
      expect(subject.valid_move?('')).to be false
    end
    it 'checks if the value selected is a valid move' do
      selection = rand(1..9)
      subject.add_to_board(selection)
      expect(subject.valid_move?(selection)).to eql(false)
    end
  end

  describe '#add_to_board' do
    let(:alphabet) { nil }
    board = [' '] * 9
    selection = rand(1..9)
    board.delete_at(selection - 1)
    it 'should add the choice of the player to the board' do
      output = board.insert(selection - 1, alphabet)
      subject.add_to_board(selection)
      expect(subject.add_to_board(selection)).to eq(output)
    end
  end
end

describe Board do
  describe '#win?' do
    context 'when there is a win horizontal middle' do
      let(:board) { [' ', ' ', ' ', 'O', 'O', 'O', ' ', ' ', ' '] }
      let(:alphabet) { 'O' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win horizontal first' do
      let(:board) { ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '] }
      let(:alphabet) { 'O' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win horizontal third' do
      let(:board) { [' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', 'O'] }
      let(:alphabet) { 'O' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win first vertical' do
      let(:board) { ['X', ' ', ' ', 'X', ' ', ' ', 'X', ' ', ' '] }
      let(:alphabet) { 'X' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win middle vertical' do
      let(:board) { [' ', 'X', ' ', ' ', 'X', ' ', ' ', 'X', ' '] }
      let(:alphabet) { 'X' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win third vertical' do
      let(:board) { [' ', ' ', 'X', ' ', ' ', 'X', ' ', ' ', 'X'] }
      let(:alphabet) { 'X' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win major diagonal' do
      let(:board) { ['X', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 'X'] }
      let(:alphabet) { 'X' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end

    context 'when there is a win minor diagonal' do
      let(:board) { [' ', ' ', 'O', ' ', 'O', ' ', 'O', ' ', ' '] }
      let(:alphabet) { 'O' }
      it 'should return true' do
        expect(Board.win?(board, alphabet)).to eq true
      end
    end
  end

  describe 'when there is no win' do
    let(:board) { ['X', ' ', ' ', ' ', ' ', ' ', 'X', ' ', ' '] }
    let(:alphabet) { 'X' }
    it 'should return false' do
      expect(Board.win?(board, alphabet)).to eq false
    end
  end

  describe '#draw?' do
    it 'returns true if the board is full' do
      expect(Board.draw?(%w[X O X X O X O X O])).to be true
    end

    it 'returns false if board has an empty cell' do
      expect(Board.draw?(['X', ' '])).to be false
    end
  end
end
