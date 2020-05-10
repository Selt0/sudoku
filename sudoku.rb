require_relative 'board'

class Sudoku
  
  def self.parse_file(filename)
    board = Board.parse_file(filename)
    self.new(board)
  end

  def initialize(board)
    @board = board
  end

  #user methods
  def get_pos
    pos = nil 
    until pos && valid_pos?(pos)
      puts "Enter a position on the board (e.g., '0 4')"
      print "> "
      pos = parse_pos(gets.chomp)
    end
    pos
  end

  def get_val
    val = nil
    until val && valid_val?(val)
      puts "Enter a value between 1 and 9 (0 to clear the tile)"
      print "> "
      val = parse_val(gets.chomp)
    end
    val
  end

  def parse_pos(string)
    string.split.map{ |char| char.to_i}
  end

  def parse_val(string)
    Integer(string)
  end

  def valid_pos?(pos)
    pos.is_a?(Array) && 
    pos.length == 2  && 
    pos.all?{ |x| x.between?(0, board.size - 1) }
  end

  def valid_val?(val)
    val.is_a(Integer) && val.between?(0, 9)
  end

  private 
  attr_reader :board
end