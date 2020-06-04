require_relative '../lib/game.rb'

describe Game do
  let(:board) { [' '] * 9 }
  subject(:game) { Game.new(board) }
  let(:player_one_name) { 'Marylene' }
  let(:player_two_name) { 'Glory' }
  let(:player_one_symbol) { 'X' }
  let(:player_two_symbol) { 'O' }

  describe '#initialize' do
    context '' do
      subject(:game) { Game.new }
      it "is initialized with a value of board=[' '] * 9 by default" do
        expect(subject.board).to eq board
      end
    end

    it "should initialize the Game class with a value of board=arr when passed an argument 'arr' " do
      expect(subject.class).to eq(Game)
      expect(subject.board).to eq board
    end
  end

  describe '#valid_alphabet' do
    it "returns true when choice is 'X' " do
      expect(subject.valid_alphabet?('X')).to eq(true)
    end

    it "returns true when choice is 'O' " do
      expect(subject.valid_alphabet?('O')).to eq(true)
    end

    it "returns false when choice is neither 'X' or 'O' " do
      expect(subject.valid_alphabet?('C')).to eq(false)
    end
  end

  describe '#current_player' do
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
end

describe Board do
  subject(:game) { Game.new(board) }
  let(:player_one_name) { 'Marylene' }
  let(:player_two_name) { 'Glory' }
  let(:player_one_symbol) { 'X' }
  let(:player_two_symbol) { 'O' }

  describe '#win?' do
    context 'when there is a win horizontal middle' do
      subject(:game) { Game.new([' ', ' ', ' ', 'O', 'O', 'O', ' ', ' ', ' ']) }
      let(:num) { 3 }
      it 'should return true' do
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win horizontal first' do
      subject(:game) { Game.new(['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']) }
      let(:num) { 3 }
      it 'should return true' do
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win horizontal third' do
      subject(:game) { Game.new([' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', 'O']) }
      let(:num) { 3 }
      it 'should return true' do
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win first vertical' do
      subject(:game) { Game.new(['X', ' ', ' ', 'X', ' ', ' ', 'X', ' ', ' ']) }
      let(:num) { 2 }
      it 'should return true' do
        subject.player1_select = player_one_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win middle vertical' do
      subject(:game) { Game.new([' ', 'X', ' ', ' ', 'X', ' ', ' ', 'X', ' ']) }
      let(:num) { 2 }
      it 'should return true' do
        subject.player1_select = player_one_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win third vertical' do
      subject(:game) { Game.new([' ', ' ', 'X', ' ', ' ', 'X', ' ', ' ', 'X']) }
      let(:num) { 2 }
      it 'should return true' do
        subject.player1_select = player_one_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win major diagonal' do
      subject(:game) { Game.new(['X', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 'X']) }
      let(:num) { 2 }
      it 'should return true' do
        subject.player1_select = player_one_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is a win minor diagonal' do
      subject(:game) { Game.new([' ', ' ', 'O', ' ', 'O', ' ', 'O', ' ', ' ']) }
      let(:num) { 3 }
      it 'should return true' do
        subject.player2_select = player_two_symbol
        subject.current_player(num)
        expect(subject.win?).to eq true
      end
    end

    context 'when there is no win' do
      subject(:game) { Game.new(['X', ' ', ' ', ' ', ' ', ' ', 'X', ' ', ' ']) }
      let(:num) { 2 }
      it 'should return false' do
        subject.player1_select = player_one_symbol
        subject.current_player(num)
        expect(subject.win?).to eq false
      end
    end
  end
  describe '#no_win?' do
    subject(:game) { Game.new(%w[X O X X O X O X O]) }
    it 'returns true if the board is full' do
      expect(subject.no_win?).to be true
    end

    context 'when the board has an empty cell and there is no winner' do
      subject(:game) { Game.new(['X', ' ']) }
      it 'returns false if board has an empty cell' do
        expect(subject.no_win?).to be false
      end
    end
  end
end
