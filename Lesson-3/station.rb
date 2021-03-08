class Station
  attr_reader :train_station 
  def initialize(name_station)
    @name_station = name_station
    @train_station = {passenger: [], cargo: []}
  end

  def park_train(train)
    if train.type == "passenger"
      @train_station[:passenger] << train
    elsif train.type == "cargo"
      @train_station[:cargo] << train
    end
  end

  def go_train(train)
    if train.type == "passenger"
      @train_station[:passenger].delete(train)
    elsif train.type == "cargo"
      @train_station[:cargo].delete(train)
    end
  end
  
  def list_of_trains
    puts 'Pas: ' + "#{ (@train_station[:passenger]).size}"
    puts 'Carg: ' + "#{ (@train_station[:cargo]).size }"
  end

  def show_train_station
    puts @train_station
  end


end
   