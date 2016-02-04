# Quick and rough example of a lottery generator
# Karl Turner: 04/02/2016

# Simple Lottery generator
class LotteryGen
  attr_accessor :limits

  # Construct and set limits attrib
  def initialize
    @limits = 1..49
  end

  def numbers
    generate_numbers
  end

  private

  def generate_numbers
    range = Array(@limits).shuffle
    numbers = []
    6.times { numbers << range.pop }
    numbers
  end
end
