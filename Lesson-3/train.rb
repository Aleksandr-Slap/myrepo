class Train

  attr_accessor :speed, :route, :current_station
  attr_reader :amount_wagons, :type, :name

  def initialize(number, type, amount_wagons)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @route = route
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
    @current_station = route.first_station
  end

  def move_back_station
    if current_station == @route.first_station
      puts "It'sy first_station"
    else
      @current_station = @route.all_stations[index_current_station - 1]
    end
  end

  def move_next_station
    if current_station == @route.last_station
      puts "It's last_station"
    else
     @current_station = @route.all_stations[index_current_station + 1]
    end
  end

  def show_next_station
    if current_station == route.last_station
      puts "It's last_station"
    else  
      @route.all_stations[index_current_station + 1]
    end  
  end 

  def show_current_station
    @current_station
  end 

  def show_back_station
    if current_station == route.first_station
      puts "It's first station"
    else  
      @route.all_stations[index_current_station - 1]
    end  
  end

  def index_current_station
    @route.all_stations.index(@current_station)
  end
end

require './route.rb'
require './station.rb'

train1 = Train.new("Red Arrow", "passenger", 12)
# train2 = Train.new("Cargo345", "cargo", 56)
# train3 = Train.new("Cargo123", "cargo", 91)
# train4 = Train.new("Star", "passenger", 56)



mga = Station.new("Mga")
volhov = Station.new("Volhov")
spb = Station.new("SPB")

rout = Route.new(volhov, spb)
rout.add_station(mga)
rout.all_station

train1.get_route(rout)

# p train1.show_current_station
# p train1.show_back_station
# p train1.show_next_station


# mga.park_train(train1)
# mga.park_train(train2)
# mga.park_train(train3)
# mga.park_train(train4)

# mga.go_train(train1)
# mga.go_train(train3)
# mga.go_train(train2)
# p train1.move_next_station

# p train1.move_next_station

# p train1.move_next_station
# p train1.move_back_station
# p train1.move_back_station

# p train1.show_back_station
# p train1.show_current_station
# p train1.show_next_station

p rout.all_station
