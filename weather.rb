require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'rest-client'
require 'yahoo-weather'


get '/' do
  erb :index
end

post '/results' do
  client = YahooWeather::Client.new
  response = client.lookup_by_woeid(2488892)
  @gamble = response.title
  erb :results
end