class Weather
    
    attr_accessor :condition, :activity

    def initialize
        @condition = ''
        @activity = 'drink beer'
    end

    def what_to_do
      case @condition
      when 'clear-day'  
        @activity = 'drink beer'
      when 'clear-night'
        @activity = 'drink beer'
      when 'rain'  
        @activity = 'drink beer'
      when 'snow'
        @activity = 'drink beer'
      when 'sleet'  
        @activity = 'drink beer'
      when 'wind'
        @activity = 'drink beer'
      when 'fog'  
        @activity = 'drink beer'
      when 'cloudy'
        @activity = 'drink beer'
      when 'partly-cloudy-day'  
        @activity = 'drink beer'
      when 'partly-cloudy-night'
        @activity = 'drink beer'      
      else
        @activity ='your lost, so drink some beer'
      end
    end
end