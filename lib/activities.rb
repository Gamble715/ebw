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
        @activity = ['drink beer','movies']
      when 'clear-night'
        @activity = ['drink beer','movies']
      when 'rain'  
        @activity = ['drink beer','movies']
      when 'snow'
        @activity = ['drink beer','movies']
      when 'sleet'  
        @activity = ['drink beer','movies']
      when 'wind'
        @activity = ['drink beer','movies']
      when 'fog'  
        @activity = ['drink beer','movies']
      when 'cloudy'
        @activity = ['drink beer','movies']
      when 'partly-cloudy-day'  
        @activity = ['drink beer','movies']
      when 'partly-cloudy-night'
        @activity = ['drink beer','movies']      
      else
        @activity ='your lost, so drink some beer'
      end
    end
end