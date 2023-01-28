require_relative '../lib/board'

require 'rspec'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a new 6x7 grid filled with dots' do
      expect(board.grid).to eq(Array.new(6) { Array.new(7, '.') })
    end

    it 'sets last_move to nil' do
      expect(board.last_move).to be_nil
    end
  end

  describe '#drop_disc' do
    it 'drops a disc in the specified column' do
      board.drop_disc(1, 'X')
      expect(board.grid[5][1]).to eq('X')
    end

    it 'updates last_move with the coordinates of the disc' do
      board.drop_disc(1, 'X')
      expect(board.last_move).to eq([5, 1])
    end

    it 'returns true if the disc was successfully placed' do
      expect(board.drop_disc(1, 'X')).to be true
    end

    it 'returns false if the column is full' do
      6.times { board.drop_disc(1, 'X') }
      expect(board.drop_disc(1, 'X')).to be false
    end
  end

  describe '#draw' do
    it 'draws the current state of the board to the console' do
      board.drop_disc(1, 'X')
      expect { board.draw }.to output("| 0 | 1 | 2 | 3 | 4 | 5 | 6 |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   |   |   |   |   |   |   |\n|   | X |   |   |   |   |   |\n").to_stdout
    end
  end

  describe '#check_full' do
    it 'returns true if the board is full' do
      6.times { |_| 7.times { |j| board.drop_disc(j, 'X') } }
      expect(board.check_full).to be true
    end

    it 'returns false if the board is not full' do
      board.drop_disc(1, 'X')
      expect(board.check_full).to be false
    end
  end

  describe '#check_winner' do
    it 'returns the disc of the winner if there is a horizontal win' do
      4.times { |i| board.drop_disc(i, 'X') }
      expect(board.check_winner).to eq('X')
    end

    it 'returns the disc of the winner if there is a vertical win' do
      4.times { |_| board.drop_disc(1, 'X') }
      expect(board.check_winner).to eq('X')
    end

    it 'returns the disc of the winner if there is a diagonal win' do
      board.drop_disc(0, 'X')
      board.drop_disc(1, 'X')
      board.drop_disc(1, 'O')
      board.drop_disc(2, 'X')
      board.drop_disc(2, 'O')
      board.drop_disc(2, 'X')
      board.drop_disc(3, 'X')

      expect(board.check_winner).to eq('X')
    end

    it 'returns nil when there is no winner' do
      board.drop_disc(0, 'X')
      board.drop_disc(1, 'X')
      board.drop_disc(1, 'O')
      board.drop_disc(2, 'X')
      board.drop_disc(2, 'O')
      board.drop_disc(2, 'X')
      board.drop_disc(3, 'O')

      expect(board.check_winner).to be_nil
    end
  end
end
