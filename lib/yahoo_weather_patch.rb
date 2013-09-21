class YahooWeather::Atmosphere
  def initialize (payload)
    @humidity = payload['humidity'].to_i
    @visibility = payload['visibility'].to_i
    @pressure = payload['pressure'].to_f

    # map barometric pressure direction to appropriate constant
    @barometer = nil
    case payload['rising'].to_i
    when 0 then @barometer = Barometer::STEADY
    when 1 then @barometer = Barometer::RISING
    when 2 then @barometer = Barometer::FALLING
    end
  end
end
