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

get '/zipcode' do
  erb :zipcode
end


post '/results' do
  # Convert string to URI ruby.. URL safe
  # url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:city]}&sensor=false"
  # response = RestClient.get url, :accept => :json
  # response2 = JSON.load(response)

  # weather.lat = response2['results'][0]['geometry']['location']['lat']
  # weather.lng = response2['results'][0]['geometry']['location']['lng']

  url = "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{params[:latitude]},#{params[:longitude]}&sensor=false"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)

  weather.lat = params['latitude']
  weather.lng = params['longitude']

  @lat = weather.lat
  @lng = weather.lng

  forecast = ForecastIO.forecast(weather.lat, weather.lng)
  weather.condition = forecast.minutely.icon
  weather.what_to_do
  # want abilitiy to change number of activities
  @location_name = response2['results'][0]['address_components'][3]['short_name']
  @activities = weather.activity[0..5]
  @currentSummary = forecast.currently.summary
  @currentTemp = forecast.currently.temperature
  @daySummary = forecast.hourly.summary
  # @test = forecast.minutely.icon
  erb :results
end

post '/results/zipcode' do
  # Convert string to URI ruby.. URL safe
  url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:city]}&sensor=false"
  response = RestClient.get url, :accept => :json
  response2 = JSON.load(response)

  weather.lat = response2['results'][0]['geometry']['location']['lat']
  weather.lng = response2['results'][0]['geometry']['location']['lng']


  @lat = weather.lat
  @lng = weather.lng

  forecast = ForecastIO.forecast(weather.lat, weather.lng)
  if forecast.minutely.nil?
      @error = "Please enter a valid zipcode."
      erb :zipcode
  else
    weather.condition = forecast.minutely.icon
    weather.what_to_do
    # want abilitiy to change number of activities
    @location_name = response2['results'][0]['address_components'][1]['short_name']
    @activities = weather.activity[0..5]
    @currentSummary = forecast.currently.summary
    @currentTemp = forecast.currently.temperature
    @daySummary = forecast.hourly.summary
    # @test = forecast.minutely.icon
    erb :results
  end
end

post "/map/:event" do
  @lat = weather.lat
  @lng = weather.lng
  @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{params[:event]}&sensor=false&key=#{ENV['GKEY']}"

  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  @vicinity_array=[]
  @rating_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @vic = response2['results'][index]['vicinity']
    @rating = response2['results'][index]['rating']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
    @vicinity_array << @vic.split(',')[0]
    if @rating
      @rating_array << @rating
    else
      @rating_array << 'N/A'
    end 
  end

  erb :map
end








