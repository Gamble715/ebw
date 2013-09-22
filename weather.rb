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
  # we think we can refactor
  @but0 = weather.activity[0]
  @but1 = weather.activity[1]
  @but2 = weather.activity[2]
  @but3 = weather.activity[3]
  @but4 = weather.activity[4]
  @but5 = weather.activity[5]
  @currentSummary = forecast.currently.summary
  @currentTemp = forecast.currently.temperature
  @daySummary = forecast.hourly.summary
  @test = forecast.minutely.icon
  erb :results
end
#want post "/map/#{weather.activity[0]}"
post "/map/bar" do
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[0]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end

post "/map/movie_theater" do
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[1]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end

post "/map/book_store" do
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[2]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end

post "/map/gas_station" do 
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[3]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end

post "/map/restaurant" do
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[4]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end

post "/map/liquor_store" do
  #refactor
  @lat = weather.lat
  @lng = weather.lng
  @url = ''
  (0..5).collect do |i|
    if weather.activity[i] == weather.activity[5]
      @url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{weather.lat},#{weather.lng}&rankby=distance&types=#{weather.activity[i]}&sensor=false&key=#{ENV['GKEY']}"
    end
  end
  response = RestClient.get @url, :accept => :json
  response2 = JSON.load(response)
  
  @name_array = []
  @lat_array = []
  @lng_array = []
  # can tweek would adjust amount of response - cool to change map size with # of responses 
  (0..6).collect do |index|
    @name = response2['results'][index]['name']
    @lat = response2['results'][index]['geometry']['location']['lat']
    @lng = response2['results'][index]['geometry']['location']['lng']
    @name_array << @name
    @lat_array << @lat
    @lng_array << @lng
  end

  erb :map
end







