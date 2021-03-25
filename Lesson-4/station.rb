class Station

  attr_reader :the_trains, :name

  def initialize(name)
    @name= name
    @the_trains = []
  end

  def park_train(train)
    @the_trains << train
  end 
  
  def go_train(train)
    @the_trains.delete(train)
  end 
end  