class Board
  attr_accessor :grid, :last_move

  def initialize
    @grid = Array.new(6) { Array.new(7, '.') }
    @last_move = nil
  end

  def drop_disc(column, disc)
    (0...6).reverse_each do |row|
      next unless @grid[row][column] == '.'

      @grid[row][column] = disc
      @last_move = [row, column]
      return true
    end
    false
  end

  def draw
    puts '| 0 | 1 | 2 | 3 | 4 | 5 | 6 |'
    @grid.each do |row|
      row.each do |cell|
        if cell == '.'
          print '|   '
        else
          print "| #{cell} "
        end
      end
      puts '|'
    end
  end

  def check_full
    @grid.flatten.none? { |cell| cell == '.' }
  end

  def check_winner
    row, col = @last_move
    return nil if row.negative? || row >= 6 || col.negative? || col >= 7

    disc = @grid[row][col]

    count = 0
    (col - 3..col + 3).each do |c|
      break if c.negative? || c >= 7

      if @grid[row][c] == disc
        count += 1
        return disc if count == 4
      else
        count = 0
      end
    end

    count = 0
    6.times do |r|
      break if r >= 6

      if @grid[r][col] == disc
        count += 1
        return disc if count == 4
      else
        count = 0
      end
    end

    count = 0
    (row - 3..row + 3).each do |r|
      c = col + (r - row)
      break if r.negative? || r >= 6 || c.negative? || c >= 7

      if @grid[r][c] == disc
        count += 1
        return disc if count == 4
      else
        count = 0
      end
    end

    count = 0
    (row - 3..row + 3).each do |r|
      c = col - (r - row)
      break if r.negative? || r >= 6 || c.negative? || c >= 7

      if @grid[r][c] == disc
        count += 1
        return disc if count == 4
      else
        count = 0
      end
    end
    nil
  end
end
