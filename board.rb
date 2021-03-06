require_relative 'tile'

class Board

  def self.parse_file(filename)
    rows = File.readlines(filename).map(&:chomp)

    tiles = rows.map do |row|
      nums = row.split('').map { |num| num.to_i } 

      nums.map { |num| Tile.new(num) }
      end
    
    self.new(tiles)
  end

  def initialize(board)
    @board = board
  end

  def [](pos)
    x, y = pos
    board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = board[x][y]
    tile.value = value
  end

  def rows
    board
  end

  def cols
    rows.transpose
  end

  def squares
    (0..8).to_a.map{ |i| square(i) }
  end

  def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def render
    puts "  #{(0..8).to_a.join(' ')}"
    board.each_with_index do |row, i|
      puts "#{i} #{row.join(' ') }"
    end
  end

  def solved?
    rows.all?{ |row| solved_set?(row) } &&
    cols.all?{ |col| solved_set?(col) }  &&
    squares.all?{ |sqaure| solved_set?(square) }
  end

  def solved_set?(tiles)
    nums = tiles.map(&:value)

    nums.sort == (1..9).to_a
  end

  def size
    board.size
  end

  private

  attr_reader :board
end