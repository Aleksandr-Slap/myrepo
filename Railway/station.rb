
require './instanse_counter.rb'

class Station

  include InstanceCounter

  @@name_stations = []
  @instances = 0

  attr_reader :the_trains, :name
  

  def self.all
    puts @@name_stations
  end   

  def initialize(name)
    @name = name
    @the_trains = []
    @@name_stations << name
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