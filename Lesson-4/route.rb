class Route
  attr_reader :first_station, :last_station, :intermediate_stations, :delete_station

  def initialize (first_station,
                  last_station,
                  intermediate_stations = [])
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = intermediate_stations
  end

  def add_station(station)
    @intermediate_stations << station
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def all_station
    [@first_station] + @intermediate_stations + [@last_station]
  end
end