class Weather
    
    attr_accessor :condition, :activity, :lat, :lng, :selection

    def initialize
        @condition = ''
        @activity = ['bar','movie_theater', 'book_store', 'gas_station', 'restaurant', 'liquor_store']
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