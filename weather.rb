require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'rest-client'
require 'forecast_io'
require 'typhoeus/adapters/faraday'

Faraday.default_adapter = :typhoeus


get '/' do
  erb :index
end

post '/results' do
  forecast = ForecastIO.forecast(37.8267, -122.423)
  @gamble = forecast.hourly.summary
  erb :results
end





ForecastIO.api_key = '47b3838c61368a05d35630e2a7b8bfd9'