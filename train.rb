
require './manufacturer.rb'
require './instanse_counter.rb'

class Train

  include InstanceCounter
  include Manufacturer

  @@trains = []
  

  attr_accessor :speed, :current_station, :train_vagons
  attr_reader :type, :number, :route, :speed

  FORMAT_NUMBER = /^.{3}.{0,1}.{2}$/

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @train_vagons = []
    @@trains << self
    register_instance
    self.class.instances
    validate!
  end

  def valid?(object)
    if object.class == Train || PassengerTrain || CargoTrain
      self.number.length > 4 and ['passenger', 'cargo'].include?(@type)   
    end  
  end  

  def validate!
    raise "Invalid number format" if number !~ FORMAT_NUMBER
    raise "The number is too short (min. 5 simbols)" if number.length < 5
    raise "Type must have been passenger or cargo" if type != 'passenger' && type != 'cargo'
  end

  def self.find(number_of_train)
    @@trains.find {|train| train.number == number_of_train}
  end  

  def stop_speed
    @speed = 0
  end

  def add_vagon(vagon)
    if @type == vagon.type_vagon && speed == 0
      @train_vagons << vagon
    end
  end

  def unhook_wagon(vagon)
    @train_vagons.delete(vagon) if  speed == 0  
  end

  def get_route(route)
    @route = route
    @current_station = @route.first_station
    @current_station.park_train(self)
  end

  def move_next_station
    @current_station.go_train(self)
    @current_station = @route.all_station[index_current_station + 1]
    @current_station.park_train(self)
  end

  def move_back_station
    @current_station.go_train(self)
    @current_station = @route.all_station[index_current_station - 1]
    @current_station.park_train(self)
  end


  def next_station
    @route.all_station[index_current_station + 1]
  end 

  def show_current_station
    @current_station
  end 

  def show_back_station
    @route.all_station[index_current_station - 1]
  end  
  
  def index_current_station
    @route.all_station.index(@current_station)
  end
end

