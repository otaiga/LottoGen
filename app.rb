require 'sinatra'
require './lib/lottery_gen'

helpers do
  def lotto_gen
    @lotto_gen ||= LotteryGen.new
  end
end

get '/' do
  lotto_gen.numbers.to_s
end
