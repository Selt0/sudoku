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
end