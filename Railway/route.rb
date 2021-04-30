# frozen_string_literal: true

require './instanse_counter'

class Route
  include InstanceCounter

  @instances = 0

  attr_reader :first_station, :last_station, :intermediate_stations

  def initialize(first_station,
                 last_station,
                 intermediate_stations = [])
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = intermediate_stations
    register_instance
    validate!
  end

  # rubocop:disable Style/GuardClause

  def valid?(object)
    if object.instance_of?(Route)
      (first_station.length > 1) ||
        (last_station.length > 1 and first_station == first_station.capitalize) ||
        (last_station == last_station.capitalize)
    end
  end

  # rubocop:disable Metrics/AbcSize

  def validate!
    raise 'Station name is too short' if first_station.name.length < 2 || last_station.name.length < 2
    if first_station.name != first_station.name.capitalize || last_station.name != last_station.name.capitalize

      raise 'Station name is capitalized'
    end
  end

  # rubocop:enable Metrics/AbcSize, Style/GuardClause

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
