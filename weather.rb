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
  # www = params[:city]
  # ddd = wwww.findwoeid
  response = client.lookup_by_woeid(12792283)
  @gamble = response.title
  @gamble1 = response.condition.text
  @gamble2 = params[:city]
  erb :results
end