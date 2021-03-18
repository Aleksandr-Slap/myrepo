require './route.rb'
require './station.rb'
require './train.rb'
require './passenger.rb'
require './cargo.rb'
require './vagon.rb'
require './vagon_p.rb'
require './vagon_c.rb'
require './management_program.rb'




puts volhov
p volhov.show_type_train
train1 = PassengerTrain.new("Red Arrow")
train2 = CargoTrain.new("Long Serpent")

volhov = Station.new("Volhov")
mga = Station.new("Mga")
giharevo = Station.new("Giharevo")
spb = Station.new("SPB")

rout = Route.new(volhov, spb)
rout.add_station(giharevo)
rout.add_station(mga)
rout.all_station

train1.get_route(rout)
train2.get_route(rout)

cargo = CargoVagon.new(1)
cargo2 = CargoVagon.new(2)
cargo3 = CargoVagon.new(3)
cargo4 = CargoVagon.new(4)
cargo5 = CargoVagon.new(5)
passenger = PassengerVagon.new(1)
passenger2 = PassengerVagon.new(2)
passenger3 = PassengerVagon.new(3)
passenger4 = PassengerVagon.new(4)
passenger5 = PassengerVagon.new(5)

train2.add_vagon(cargo)
train2.add_vagon(cargo2)
train2.add_vagon(cargo3)
train2.add_vagon(cargo4)
train2.add_vagon(cargo5)
# p train2.train_vagons

train1.add_vagon(passenger)
train1.add_vagon(passenger2)
train1.add_vagon(passenger3)
train1.add_vagon(passenger4)
train1.add_vagon(passenger5)
# p train1.train_vagons


train1.move_back_station
train2.move_next_station
train2.move_next_station
p train2.current_station

Interface.new.start!