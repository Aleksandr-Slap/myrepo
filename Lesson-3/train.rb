class Train

  attr_accessor :speed, :current_station
  attr_reader :amount_wagons, :type

  def initialize(number, type, amount_wagons)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @speed = 0
  end

  def stop_speed
    @speed = 0
  end

  def attach
    @amount_wagons += 1 if @speed == 0
  end

  def unhook
    @amount_wagons -= 1 if @speed == 0
  end

  def get_route(route)
    @route = route
    @current_station = @route.first_station
    @current_station.park_train(self)
  end

  def move_next_station
    if current_station == @route.last_station
      puts "It's last_station"
    else
     @current_station.go_train(self)
     @current_station = @route.all_station[index_current_station + 1]
    end
     @current_station.park_train(self)
  end

  def move_back_station
    if current_station == @route.first_station
      puts "It'sy first_station"
    else
      @current_station.go_train(self)
      @current_station = @route.all_station[index_current_station - 1]
    end
    @current_station.park_train(self)
  end


  def next_station
    if current_station == @route.last_station
      puts "It's last_station"
    else  
      @route.all_station[index_current_station + 1]
    end  
  end 

  def show_current_station
    @current_station
  end 

  def show_back_station
    if current_station == @route.first_station
      puts "It's first station"
    else  
      @route.all_station[index_current_station - 1]
    end  
  end

  def index_current_station
    @route.all_station.index(@current_station)
  end
end

require './route.rb'
require './station.rb'

train1 = Train.new("Red Arrow", "passenger", 12)
train2 = Train.new("Cargo345", "cargo", 56)
train3 = Train.new("Cargo123", "cargo", 91)
train4 = Train.new("Star", "passenger", 56)



volhov = Station.new("Volhov")
mga = Station.new("Mga")
giharevo = Station.new("Giharevo")
spb = Station.new("SPB")

rout = Route.new(volhov, spb)
rout.add_station(mga)
rout.add_station(giharevo)
# p rout.all_station

train1.get_route(rout)
puts volhov.trains.size


train1.move_next_station
volhov.trains.size

mga.show_type_train
train1.move_next_station
train1.move_next_station

spb.show_type_train
train1.move_back_station
giharevo.show_type_train
train1.move_back_station
mga.show_type_train
train1.move_back_station
giharevo.show_type_train

p train1.current_station
p train1.next_station
puts train1.show_back_station