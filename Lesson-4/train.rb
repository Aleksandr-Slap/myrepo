class Train

  attr_accessor :speed, :current_station, :train_vagons
  attr_reader :type, :number, :route, :speed

  def initialize(number)
    @number = number
    @type = type
    @speed = 0
    @train_vagons = []
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