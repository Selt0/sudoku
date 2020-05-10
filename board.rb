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

  private

  attr_reader :board
end