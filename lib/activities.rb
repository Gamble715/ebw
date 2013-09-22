class Weather
    
    attr_accessor :condition, :activity, :lat, :lng

    def initialize
        @condition = ''
        @activity = []
        @lat = ''
        @lng = ''
    end

    def what_to_do
      case @condition
      when 'clear-day'  
        @activity = ['bar','movies']
      when 'clear-night'
        @activity = ['bar','movies']
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
end