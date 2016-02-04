#!/usr/bin/env ruby
# Quick and rough example of a lottery generator from cli command
# Karl Turner: 04/02/2016

# Simple module just for fun
module LotteryOutput
  # Simple Lottery generator
  class LotteryGen
    attr_accessor :numbers
    # Set range for lotto numbers
    RANGE = 1..49

    # Construct and set numbers attrib
    def initialize
      # create array of shuffled available numbers
      range = Array(RANGE).shuffle
      # emtpy array of numbers
      @numbers = []
      # Alternative: @numbers << generate_number
      # Pop out of array from range
      6.times { @numbers << range.pop }
    end

    def nice_format
      @numbers.join(', ')
    end

    def default_message
      "Hi this is a simple lottery generator. \nPlease type 'help' after command for more options"
    end

    private

    # Loop through randon number until number found
    # If number already in array, keep looping
    def generate_number
      loop do
        number = rand(RANGE)
        break number unless @numbers.include?(number)
      end
    end
  end

  def default_output
    puts lottery_gen.default_message
    puts "Your Numbers:"
    puts lottery_gen.numbers
  end

  def pretty_output
    "Your Numbers: \n #{lottery_gen.nice_format}"
  end

  def lottery_gen
    @generated ||= LotteryGen.new
  end
end

begin
  # Clear screen
  system('clear')
  # Include module
  include LotteryOutput
  # Obtain argument
  arg = ARGV[0].to_s
  if arg.empty?
    default_output
  else
    case arg.to_s.upcase
    when 'PRETTY'
      puts pretty_output
    when 'HELP'
      puts "Print out pretty format using the arugument 'pretty'"
    else
      default_output
    end
  end
end