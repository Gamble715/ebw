class Weather
    
    attr_accessor :condition, :activity

    def initialize
        @condition = ''
        @activity = 'drink'
    end

    def what_to_do
        if @condition == 'clear-day'
           @activity = 'drink beer'
        else
           @activity ='your lost'
        end
    end
end