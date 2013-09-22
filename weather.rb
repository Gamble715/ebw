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
  weather.what_to_do
  @sug1 = weather.activity[0]
  @sug2 = weather.activity[1]
  @currentSummary = forecast.currently.summary
  @currentTemp = forecast.currently.temperature
  @daySummary = forecast.hourly.summary
  @test = forecast.minutely.icon
  erb :results
end

post '/map' do
   # url = "https://maps.googleapis.com/maps/api/place/radarsearch/json?location=#{weather.lat},#{weather.lng}&radius=5000&types=bar&sensor=false&key=AIzaSyCaKk1sID5-mNMOgd1HGwJfqk_PNLC6ZZ8"
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  url1 = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[0]}&sensor=false&key=AIzaSyCaKk1sID5-mNMOgd1HGwJfqk_PNLC6ZZ8"
  response = RestClient.get url1, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  (1..5).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
  # @name2 = response2['results'][1]['name']
  # @lat2 = response2['results'][1]['geometry']['location']['lat']
  # @lng2 = response2['results'][1]['geometry']['location']['lng']
  # url2 = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=movies&sensor=false&key=AIzaSyCaKk1sID5-mNMOgd1HGwJfqk_PNLC6ZZ8"
  # response3 = RestClient.get url2, :accept => :json
  # response4 = JSON.load(response3)
  # @name3 = response4['results'][0]
  # @lat2 = response4['results'][1]['geometry']['location']['lat']
  # @lng2 = response4['results'][1]['geometry']['location']['lng'] 
 
end








