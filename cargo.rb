require './train.rb'

class CargoTrain < Train 

  def initialize(number)
	@type = "cargo"
	super
  end	
end