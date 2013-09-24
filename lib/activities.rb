# require "places.rb"

class Weather
    
    attr_accessor :condition, :activity, :lat, :lng, :selection

    def initialize
        @condition = ''
        @activity = %w(accounting airport amusement_park aquarium art_gallery
                        atm
                        bakery
                        bank
                        bar
                        beauty_salon
                        bicycle_store
                        book_store
                        bowling_alley
                        bus_station
                        cafe
                        campground
                        car_dealer
                        car_rental
                        car_repair
                        car_wash
                        casino
                        cemetery
                        church
                        city_hall
                        clothing_store
                        convenience_store
                        courthouse
                        dentist
                        department_store
                        doctor
                        electrician
                        electronics_store
                        embassy
                        establishment
                        finance
                        fire_station
                        florist
                        food
                        funeral_home
                        furniture_store
                        gas_station
                        general_contractor
                        grocery_or_supermarket
                        gym
                        hair_care
                        hardware_store
                        health
                        hindu_temple
                        home_goods_store
                        hospital
                        insurance_agency
                        jewelry_store
                        laundry
                        lawyer
                        library
                        liquor_store
                        local_government_office
                        locksmith
                        lodging
                        meal_delivery
                        meal_takeaway
                        mosque
                        movie_rental
                        movie_theater
                        moving_company
                        museum
                        night_club
                        painter
                        park
                        parking
                        pet_store
                        pharmacy
                        physiotherapist
                        place_of_worship
                        plumber
                        police
                        post_office
                        real_estate_agency
                        restaurant
                        roofing_contractor
                        rv_park
                        school
                        shoe_store
                        shopping_mall
                        spa
                        stadium
                        storage
                        store
                        subway_station
                        synagogue
                        taxi_stand train_station travel_agency university veterinary_care zoo)
        @lat = ''
        @lng = ''
        @selection = ''
    end

    def what_to_do
      case @condition
      when 'clear-day'  
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'clear-night'
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'rain'  
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'snow'
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'sleet'  
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'wind'
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'fog'  
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'cloudy'
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'partly-cloudy-day'  
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      when 'partly-cloudy-night'
        @activity = ['bar','movie_theater', 'book_store', 'casino', 'restaurant', 'liquor_store']   
      else
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
      end
    end

    def current_activity(i)
      @activity[i]
    end
end
