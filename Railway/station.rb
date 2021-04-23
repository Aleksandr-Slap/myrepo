
require './instanse_counter.rb'

class Station

  include InstanceCounter

  @@name_stations = []
  @@all_stations = []
  @instances = 0

  attr_reader :the_trains, :name
  

  def self.all_stations
    @@all_stations.each do |stan|
      puts "Станция: #{stan.name}"
      stan.all_trains{|train| puts  "Поезд под номером #{train.number} на станции"; puts "Тип поезда: #{train.type}"; puts "Вагонов у поезда: #{train.train_vagons.length}"}
      stan.all_trains{|train| train.all_vagons{ |vagon|puts "Номер вагона: #{vagon.number}"; puts "Свободный объём/места: #{vagon.places}"; puts "Занятый объём/места: #{vagon.occupied_places}"}} 
    end
  end    


  def all_trains 
    @the_trains.each { |train| yield train }
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
    if object.class == Station 
      self.name.length > 1 and @name == name.capitalize
    end  
  end

  def validate! 
    raise "Station name is too short" if name.length < 2 
    raise "Station name is capitalized" if name != name.capitalize
  end  

  def park_train(train)
    @the_trains << train
  end 
  
  def go_train(train)
    @the_trains.delete(train)
  end 
end  