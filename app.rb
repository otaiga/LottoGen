require 'sinatra'
require './lib/lottery_output/lottery_gen'

include LotteryOutput

get '/' do
  lottery_gen.nice_format
end
