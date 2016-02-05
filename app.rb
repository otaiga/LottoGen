require 'sinatra'
require 'json'
require './lib/lottery_gen'

helpers do
  def lotto_gen
    @lotto_gen ||= LotteryGen.new
  end
end

get '/' do
  erb :index
end

get '/lotto.json' do
  content_type :json
  {
    numbers: lotto_gen.numbers
  }.to_json
end
