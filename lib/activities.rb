# require "places.rb"

class Weather
    
    attr_accessor :condition, :activity, :lat, :lng, :activities, :canvas, :canvas_up

    def initialize
        @condition = ''
        @activities = [
                         [],# ['accounting', 'airport', 'atm', 'bank', 'bus_station', 'car_dealer', 'car_rental', 'car_repair', car_wash,cemetery, church, city_hall, courthouse, dentist, doctor, electrician, embassy, establishment, finance, fire_station, funeral_home, furniture_store, gas_station, general_contractor, grocery_or_supermarket, hair_care, hardware_store, health, hindu_temple, hospital, insurance_agency, laundry, lawyer, local_government_office, locksmith, lodgings, mosque, moving_company, painter, pharmacy, physiotherapist, place_of_worship, plumber, police, post_office, real_estate_agency, parking, roofing_contractor, rv_park, school, storage, subway_station, synagogue, taxi_stand, train_station, travel_agency, university, veterinary_care],
                         ['bar', 'zoo', 'park', 'amusement_park', 'restaurant', 'campground'],
                         ['bar', 'night_club', 'campground', 'casino', 'restaurant', 'liquor_store'],
                         ['bar', 'movie_theater', 'book_store', 'spa', 'bowling_alley', 'liquor_store'],
                         ['bar', 'movie_theater', 'home_goods_store', 'shopping_mall', 'meal_delivery', 'liquor_store'],
                         ['bar', 'movie_theater', 'book_store', 'meal_delivery', 'museum', 'liquor_store'],
                         ['bar', 'department_store', 'library', 'meal_takeaway', 'restaurant', 'beauty_salon'],
                         ['bar', 'movie_theater', 'book_store', 'gym', 'aquarium', 'liquor_store'],
                         ['bar', 'movie_theater', 'book_store', 'bakery', 'art_gallery', 'shopping_mall'],
                         ['bar', 'movie_theater', 'zoo', 'meal_takeaway', 'spa', 'liquor_store'],
                         ['bar', 'night_club', 'movie_theater', 'casino', 'restaurant', 'liquor_store']
                     ] 
                        # amusement_park 
                        # bakery
                        # bar
                        # bicycle_store
                        # book_store
                        # cafe
                        # campground
                        # clothing_store
                        # convenience_store
                        # electronics_store
                        # florist
                        # food
                        # jewelry_store
                        # pet_store
                        # restaurant
                        # shoe_store
                        # stadium
                        # store
        @icons
        @lat = ''
        @lng = ''
        @selection = ''
    end

    def what_to_do
      case @condition
      when 'clear-day'  
        @activity = activities[1]
      when 'clear-night'
        @activity = activities[2]
      when 'rain'  
        @activity = activities[3]
      when 'snow'
        @activity = activities[4]
      when 'sleet'  
        @activity = activities[5]
      when 'wind'
        @activity = activities[6]
      when 'fog'  
        @activity = activities[7]
      when 'cloudy'
        @activity = activities[8]
      when 'partly-cloudy-day'  
        @activity = activities[9]
      when 'partly-cloudy-night'
        @activity = activities[10]
      else
        @activity = activities[0]
      end
    end

    def icon_to_do(condition)
      # condition = 'rain'
      case condition 
      when 'clear-day'  
        @canvas = {norm: 'clear-day', up: 'clear-day'.split('-').join('_').upcase } 
      when 'clear-night'
        @canvas = {norm: 'clear-night', up: 'clear-night'.split('-').join('_').upcase } 
      when 'rain'  
        @canvas = {norm: 'rain', up: 'rain'.split('-').join('_').upcase } 
      when 'snow'
        @canvas = {norm: 'snow', up: 'snow'.split('-').join('_').upcase } 
      when 'sleet'  
        @canvas = {norm: 'sleet', up: 'sleet'.split('-').join('_').upcase } 
      when 'wind'
        @canvas = {norm: 'wind', up: 'wind'.split('-').join('_').upcase } 
      when 'fog'  
        @canvas = {norm: 'fog', up: 'fog'.split('-').join('_').upcase } 
      when 'cloudy'
        @canvas = {norm: 'cloudy', up: 'cloudy'.split('-').join('_').upcase } 
      when 'partly-cloudy-day'  
        @canvas = {norm: 'partly-cloudy-day', up: 'partly-cloudy-day'.split('-').join('_').upcase } 
      when 'partly-cloudy-night'
        @canvas = {norm: 'partly-cloudy-night', up: 'partly-cloudy-night'.split('-').join('_').upcase } 
      end
    end

    def current_activity(i)
      @activity[i]
    end
end
