class Route
  attr_reader :first_station, :last_station

  def initialize (first_station,
                  last_station,
                  intermediate_station = [])
    @first_station = first_station
    @last_station = last_station
    @intermediate_station = intermediate_station
  end

  def add_station(station)
    @intermediate_station << station
  end

  def delete_station(station)
    @intermediate_station.delete(station)
  end

  def all_station
    [@first_station] + @intermediate_station + [@last_station]
  end
end