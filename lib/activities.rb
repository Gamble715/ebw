class Weather
    
    attr_accessor :condition, :activity, :lat, :lng, :selection

    def initialize
        @condition = ''
        @activity = []
        @lat = ''
        @lng = ''
        @selection = ''
    end

    def what_to_do
      case @condition
      when 'clear-day'  
        @activity = ['bar','amusement_park', 'movie_theater']
      when 'clear-night'
        @activity = ['bar','movie_theater', 'book_store', 'bowling_alley', 'funeral_home', 'liquor_store']
      when 'rain'  
        @activity = ['bar','movies']
      when 'snow'
        @activity = ['bar','movies']
      when 'sleet'  
        @activity = ['bar','movies']
      when 'wind'
        @activity = ['bar','movies']
      when 'fog'  
        @activity = ['bar','movies']
      when 'cloudy'
        @activity = ['bar','movies']
      when 'partly-cloudy-day'  
        @activity = ['bar','movies']
      when 'partly-cloudy-night'
        @activity = ['bar','movies']      
      else
        @activity ='your lost, so drink some beer'
      end
    end

    def current_activity(i)
      @activity[i]
    end
end