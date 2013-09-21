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
  @lat = response2['results'][0]['geometry']['location']['lat']
  @lng = response2['results'][0]['geometry']['location']['lng']
  forecast = ForecastIO.forecast(@lat, @lng)
  @currentSummary = forecast.currently.summary
  @currentTemp = forecast.currently.temperature
  @daySummary = forecast.hourly.summary
  @dayPrecipitation = forecast.minutely.icon
  erb :results
end

post '/map' do
  url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:city]}&sensor=false"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)
  @lat = response2['results'][0]['geometry']['location']['lat']
  @lng = response2['results'][0]['geometry']['location']['lng']
  erb :map
end








