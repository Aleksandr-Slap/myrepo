
require './instanse_counter.rb'

class Route

  include InstanceCounter

  @instances = 0
  
  attr_reader :first_station, :last_station, :intermediate_stations

  def initialize (first_station,
                  last_station,
                  intermediate_stations = [])
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = intermediate_stations
    register_instance
    validate!
  end

  def valid?(object)
    if object.class == Route
      self.first_station.length > 1 || self.last_station.length > 1 and first_station == first_station.capitalize || last_station == last_station.capitalize  
    end  
  end

  def validate!
   raise "Station name is too short" if first_station.length < 2 || last_station.length < 2
   raise "Station name is capitalized" if first_station != first_station.capitalize || last_station != last_station.capitalize
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