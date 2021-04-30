# frozen_string_literal: true

require './instanse_counter'

class Station
  include InstanceCounter

  # rubocop:disable Style/ClassVars

  @@name_stations = []
  @@all_stations = []

  # rubocop:enable Style/ClassVars

  @instances = 0

  attr_reader :the_trains, :name

  def self.all_stations
    @@all_stations.each do |stan|
      puts "Станция: #{stan.name}"
      stan.all_trains do |train|
        puts "Поезд под номером #{train.number} на станции"
        puts "Тип поезда: #{train.type}"
        puts "Вагонов у поезда: #{train.train_vagons.length}"
      end
      all_stations_support
    end
  end

  def all_trains(&block)
    @the_trains.each(&block)
  end

  def self.all
    @@name_stations
  end

  def initialize(name)
    @name = name
    @the_trains = []
    @@name_stations << name
    @@all_stations << self
    register_instance
    validate!
  end

  def valid?(object)
    name.length > 1 and @name == name.capitalize if object.instance_of?(Station)
  end

  def validate!
    raise 'Station name is too short' if name.length < 2
    raise 'Station name is capitalized' if name != name.capitalize
  end

  def park_train(train)
    @the_trains << train
  end

  def go_train(train)
    @the_trains.delete(train)
  end

  protected

  def all_stations_support
    stan.all_trains do |train|
      train.all_vagons do |vagon|
        puts "Номер вагона: #{vagon.number}"
        puts "Свободный объём/места: #{vagon.places}"
        puts "Занятый объём/места: #{vagon.occupied_places}"
      end
    end
  end
end
