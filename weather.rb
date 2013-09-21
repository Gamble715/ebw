require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'rest-client'
require 'forecast_io'
require 'typhoeus/adapters/faraday'
require 'geocoder'
require 'foreman'

Faraday.default_adapter = :typhoeus
ForecastIO.api_key = ENV['KEY']

get '/' do
  erb :index
end

post '/results' do
  url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:city]}&sensor=false"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)
  response3 = response2['results']
  response4 = response3[0]
  response5 = response4['geometry']
  response6 = response5['location']
  lat = response6['lat']
  lng = response6['lng']
  forecast = ForecastIO.forecast(lat, lng)
  @gamble = forecast.hourly.summary
  erb :results
    
end







