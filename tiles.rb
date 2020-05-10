require 'colorize'

class Tile
  attr_reader :value

  def initialize(value)
    @value = value
     @given = value == 0 ? false : true
  end

  def given?
    @given
  end

  def to_s
    value == 0 ?  ' ' : value.to_s.colorize(color)
  end

  def value=(new_value)
    given? ? puts "You can't change that value" : @value = new_value

  def color
    given? ? :orange : :white
  end
end