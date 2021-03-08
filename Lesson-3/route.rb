class Route
  attr_reader :first_station, :last_station, :all_stations

  def initialize (first_station,
                  last_station,
                  intermediate_station = [],
                  all_stations = [] )
    @first_station = first_station
    @last_station = last_station
    @intermediate_station = intermediate_station
    @all_stations = all_stations
  end

  def add_station(station)
    @intermediate_station << station
  end

  def delete_station(station)
    @intermediate_station.delete(station)
  end

  def all_station
    @all_stations = [@first_station] + @intermediate_station + [@last_station]
    @all_stations
  end
end