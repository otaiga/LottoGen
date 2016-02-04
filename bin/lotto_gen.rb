#!/usr/bin/env ruby
require 'rubygems'
require './lib/lottery_gen'

def lotto
  @lotto ||= LotteryGen.new
end

def help_msg
  "Print out pretty format using the arugument 'pretty'\n" \
  "Set limit with 'limit=x..x' where x is number to/from"
end

def limit_set(limit)
  limits = limit.split('..').map(&:to_i)
  lotto.limits = limits[0]..limits[1]
  lotto.numbers
end

def limit_arg(args)
  args.find { |a| /^limit=/ =~ a }
end

def numbers(args)
  limit = limit_arg(args)
  limit.to_s.empty? ? lotto.numbers : limit_set(limit.split('=')[1])
end

def process_arg(args)
  return help_msg if args.include?('help')
  return numbers(args).join(', ').to_s if args.include?('pretty')
  numbers(args)
end

begin
  # Clear screen
  system('clear')
  args = ARGV.map(&:to_s)
  if args.empty?
    puts lotto.numbers
  else
    puts process_arg(args)
  end
end
