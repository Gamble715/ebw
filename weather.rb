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
require_relative 'lib/activities'

Faraday.default_adapter = :typhoeus
ForecastIO.api_key = ENV['KEY']

weather = Weather.new

get '/' do
  erb :index
end

post '/results' do
  url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:city]}&sensor=false"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)
  weather.lat = response2['results'][0]['geometry']['location']['lat']
  weather.lng = response2['results'][0]['geometry']['location']['lng']
  @lat = weather.lat
  @lng = weather.lng
  forecast = ForecastIO.forecast(weather.lat, weather.lng)
  weather.condition = forecast.minutely.icon
  @suggestion = weather.what_to_do
  @currentSummary = forecast.currently.summary
  @currentTemp = forecast.currently.temperature
  @daySummary = forecast.hourly.summary
  @test = forecast.minutely.icon
  erb :results
end

post '/results/map' do
  url = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location=#{weather.lat},#{weather.lng}&radius=5000&types=bar&sensor=false&key=AIzaSyCaKk1sID5-mNMOgd1HGwJfqk_PNLC6ZZ8"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)
  @lat1 = response2['results'][0]['geometry']['location']['lat']
  @lng1 = response2['results'][0]['geometry']['location']['lng'] 
  @lat = weather.lat
  @lng = weather.lng
  erb :map
end








