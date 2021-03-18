class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def park_train(train)
    @trains << train
  end 
  
  def go_train(train)
    @trains.delete(train)
  end 

  def show_type_train
    puts "Passenger: #{@trains.select {|train| train.type == "passenger"}.size}"
    puts "Cargo: #{@trains.select {|train| train.type == "cargo"}.size}"  
  end  
end  