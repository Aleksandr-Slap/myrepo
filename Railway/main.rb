require './route.rb'
require './station.rb'
require './train.rb'
require './passenger.rb'
require './cargo.rb'
require './vagon.rb'
require './vagon_p.rb'
require './vagon_c.rb'

class Interface

  FORMAT_NUMBER = /^.{3}.{0,1}.{2}$/

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def start!
    loop do
      puts "Введите 1, если вы хотите создать станцию, поезд, вагон или маршрут"
      puts "Введите 2, если вы хотите произвести операции с созданными объектами"
      puts "Введите 3, если вы хотите вывести текущие данные об оъектах"
      puts "Введите 0, если хотите закончить программу"

      choice = gets.chomp.to_i
      case choice
      when 1
        create_objects
      when 2
        manage_objects
      when 3
        show_objects
      when 0
        break
      end
    end
  end
  

  
  def create_objects
  	loop do
	    puts "Введите 1, если вы хотите создать станцию(создайте минимум две станции)"
	    puts "Введите 2, если вы хотите создать маршрут"
	    puts "Введите 3, если вы хотите создать пассажирский поезд"
	    puts "Введите 4, если вы хотите создать почтовый поезд"
	    puts "Введите 5, если вы хотите создать пассажирский вагон"
	    puts "Введите 6, если вы хотите создать почтовый вагон"
      puts "Введите 7, если вы хотите добавить промежуточную станцию станцию в маршрут"
      puts "Введите 8, если вы хотите удалить промежуточную станцию из маршрута"
      puts "Введите 0, если вы хотите выйти из меню"

      choice = gets.chomp.to_i

      case choice
	    when 1
	    	create_station
	    when 2
	      create_route
	    when 3
	    	create_pass_train
	    when 4
	    	create_cargo_train
	    when 5
        create_pass_vagon
      when 6
      	create_cargo_vagon
      when 7
        add_an_intermediate_station
      when 8
        delete_an_intermediate_station
      when 0
      	break
      end	
    end  	
  end

  def manage_objects    	
    loop do
      puts "Введите 1, если вы хотите назначить маршрут для поезда"
      puts "Введите 2, если вы хотите проследовать на следующую станцию"
      puts "Введите 3, если вы хотите проследовать на предыдущую станцию"
      puts "Введите 4, если вы хотите отцепить вагон поезда"
      puts "Введите 5, если вы хотите занять место в пассажирском вагоне"
      puts "Введите 6, если вы хотите загрузить почтовый вагон"

      puts "Введите 0, если вы хотите остановиться"


      choice = gets.chomp.to_i

      case choice

      when 1
        add_route_of_train     
      when 2
        move_to_next_station  
      when 3
        move_back_station     
      when 4
        unhook_the_vagon
      when 5
        take_place
      when 6
        download_vagon
      when 0
        break
      end
    end
  end    
      
  def show_objects

    loop do
	    puts "Введите 1, если вы хотите посмотреть поезда на станции"
	    puts "Введите 2, если вы хотите узнать предыдущую станцию"
	    puts "Введите 3, если вы хотите узнать текущую станцию"
      puts "Введите 4, если вы хотите узнать следующую станцию"
	    puts "Введите 5, если вы хотите узнать количество вагонов поезда"
	    puts "Введите 0, чтобы выйти из данного меню"

      choice = gets.chomp.to_i

      case choice

      when 1
        show_trains_at_the_station
      when 2
        back_statioт_show
      when 3
        current_station_show
      when 4
        next_station_show
      when 5
        show_train_vagon
      when 0
        break
      end
    end
  end 
   
  def create_station
    puts "Введите название станции"
    name_of_station = gets.chomp.to_s
    new_station = Station.new(name_of_station)
    puts "Вы создали станцию - #{name_of_station}"
    @stations << new_station
  end

    
  def create_route
    puts "Что бы создать маршрут, вы должны были создать как минимум 2 станции"
    @stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
    puts "Введите порядковый номер первой станции"
    first_station = @stations[gets.chomp.to_i - 1]
    puts "Введите порядковый номер второй станции"
    last_station = @stations[gets.chomp.to_i - 1]
    route = Route.new(first_station, last_station)
    @routes << route
    puts "Маршрут создан: #{route.first_station.name} - #{route.last_station.name}"
  end

  def add_an_intermediate_station
    puts "Выберите маршрут, к которому хотите добавить промежуточную станцию"
    routes_with_index
    puts "Введите название станции"
    name_of_station = gets.chomp.to_s
    new_station = Station.new(name_of_station) 
    @route.add_station(new_station)
    @route = @route.all_station
    @stations << new_station
    puts "Вы добавили промежуточную станцию - #{new_station.name}"   
  end 

  def delete_an_intermediate_station
    puts "Выберите маршрут, из которого хотите удалить промежуточную станцию"
    routes_with_index
    puts "Выберите станцию, которую хотите удалить"
    @route.intermediate_stations.each_with_index do |station, index|
      puts "#{index + 1}. #{@route.intermediate_stations}"
    end  
    station = @route.intermediate_stations[gets.chomp.to_i - 1]
    @route.delete_station(station) 
    @stations.delete(station) 
  end  

  def create_pass_train 
    puts "Введите номер поезда"
    number = gets.chomp
    train = PassengerTrain.new(number)
    @trains << train
    @trains.each {|train| puts "Создан пассажирский поезд под номером #{number}"}
  rescue RuntimeError => e 
    puts "RuntimeError: #{e.message}"
    retry if @number !~ FORMAT_NUMBER
  end
  

  def create_cargo_train 
  	puts "Введите номер поезда"
    number = gets.chomp
    train = CargoTrain.new(number)
    @trains << train
    @trains.each {|train| puts "Создан почтовый поезд под номером #{number}"}
  rescue RuntimeError => e 
    puts "RuntimeError: #{e.message}"
    retry if @number !~ FORMAT_NUMBER
  end 

  def create_pass_vagon
    puts "Введите номер вагона"
    number_vagon = gets.chomp
    puts "Укажите количество мест в вагоне"
    places = gets.chomp.to_i
    vagon = PassengerVagon.new(number_vagon, places)
    "Выберите поезд, к которому хотите прицепить вагон"
    trains_with_index
    if @train.add_vagon(vagon) 
      puts "Прицеплен вагон #{vagon.number}"
    else
      puts "Тип вагона и поезда не совпадают или скорость поезда не 0 км/ч"
    end    
  end  

  def create_cargo_vagon
    puts "Введите номер вагона"
    number_vagon = gets.chomp
    puts "Укажите объём вагона куб.метрах"
    places =  gets.chomp.to_i
    vagon = CargoVagon.new(number_vagon, places)
    "Выберите поезд, к которому хотите прицепить вагон"
    trains_with_index
    if @train.add_vagon(vagon) 
      puts "Прицеплен вагон #{vagon.number}"
    else
      puts "Тип вагона и поезда не совпадают или скорость поезда не 0 км/ч"
    end 
  end

  def add_route_of_train
    puts "Выберете поезд, которому хотите добавить маршрут"
    trains_with_index
    puts "Выберете маршрут, который хотите добавить поезду"
    routes_with_index
    @train.get_route(@route)
    puts "Выбран маршрут:  #{@train.route.first_station.name} - #{@train.route.last_station.name}" 
  end 

  def move_to_next_station
    puts "Выберите поезд, который отправится на следующюю станцию"
    trains_with_index 
    if @train.route != @route
      puts "Поезду № #{@train.number} не назначен маршрут"
    elsif @train.current_station == @train.route.last_station
      puts "Это последняя станция"
    else
      @train.move_next_station
      puts "Поезд прибыл на станцию: #{@train.current_station.name}"
    end   
  end  
  
  def move_back_station
    puts "Выберите поезд, который отправится на предыдущую станцию"
    trains_with_index
    if @train.route != @route
      puts "Поезду № #{@train.number} не назначен маршрут"
    elsif @train.current_station == @train.route.first_station 
      puts "Это первая станция"
    else
      @train.move_back_station
      puts "Поезд прибыл на станцию: #{@train.current_station.name}"
    end  
  end

  def unhook_the_vagon 
    puts "Выберете поезд от которого хотите отцепить вагон"
    trains_with_index
    puts "Выберете вагон, который хотите отцепить"
    @train.train_vagons.each_with_index do |vagon, index|
      puts "#{index + 1}. #{vagon.number}"
    end  
    vagon = @train.train_vagons[gets.chomp.to_i - 1]  
    @train.unhook_wagon(vagon)
    puts "Вагон № #{vagon.number} отцеплен"
  end

  def take_place
    puts "Выберите поезд, в вогоне которого хотите занять место"
    trains_with_index
    if @train.type != "passenger"
      puts "Вы можете занять место только в пассажирском поезде"
    else
      vagons_with_index
      @vagon.take_the_place
    end   
  end

  def download_vagon
    puts "Выберите поезд, вагон которого хотите загрузить"
    trains_with_index
    if @train.type != "cargo"
      puts "Вы можете загрузить только почтовый  состав"
    else
      vagons_with_index
      puts "Укажите обьем в куб.метрах, который хотите занять"
      volume = gets.chomp.to_i
      @vagon.download(volume)
    end
  end    
      


  def show_trains_at_the_station
    Station.all_stations
    # puts "Введите номер станции, чтобы узнать есть ли на ней поезда"
    # @stations.each_with_index do |station, index|
    #   puts "#{index + 1}. #{station.name}"
    # end
    # station = @stations[gets.chomp.to_i - 1] 
    # if station.the_trains.size == 0
    #   puts "На станции нет поездов"
    # else
    #   station.the_trains.each {|train| puts "Поезд #{train.number} находится на станции"}
    #   puts "Пассажирских поездов на станции: #{station.the_trains.select {|train| train.type == "passenger"}.size}"
    #   puts "Почтовых поездов на станции: #{station.the_trains.select {|train| train.type == "cargo"}.size}"
    # end
  end 

  def show_train_vagon
    puts "Выберите, у какого поезда хотите посмотреть кличество вагонов?"
    trains_with_index 
    if @train.train_vagons.size == 0
      puts "У данного поезда нет прицепленых вагонов"
    else
      @train.all_vagons{ |vagon|puts "Номер вагона: #{vagon.number}"; puts "Свободный объём/места: #{vagon.places}"; puts "Занятый объём/места: #{vagon.occupied_places}"}
    end  
  end

  def back_statioт_show
    puts "Выберите поезд, предыдущую станцию которого вы хотите узнать"
    trains_with_index
    if @train.route != @route
      puts "Поезду № #{@train.number} не назначен маршрут"

    elsif @train.current_station == @train.route.first_station
      puts "Это первая станция"
    else  
      @train.show_back_station
      puts @train.route.all_station[@train.index_current_station - 1].name
    end   
  end
  
  def current_station_show
    puts "Выберите поезд, текущую станцию которого вы хотите узнать"
    trains_with_index
    puts @train.show_current_station.name            
  end 

  def next_station_show
    puts "Выберите поезд, следующую станцию которого вы хотите узнать"
    trains_with_index
    if @train.route != @route
      puts "Поезду № #{@train.number} не назначен маршрут" 
    elsif @train.current_station == @train.route.last_station
      puts "Это последняя станция"
    else  
      puts @train.next_station.name
    end  
  end

  private 

  def vagons_with_index
    puts "Выберете номер вагона"
    @train.train_vagons.each_with_index do |vagon, index|
      puts "#{index + 1}. Вагон номер: #{vagon.number}"
    end  
    @vagon = @train.train_vagons[gets.chomp.to_i - 1]
  end    

  def trains_with_index
    @trains.each_with_index do |train, index|
      puts "#{index + 1}. Поезд номер: #{train.number}"
    end  
    @train = @trains[gets.chomp.to_i - 1]
  end

  def routes_with_index
    @routes.each_with_index do |route, index|
      puts "#{index + 1}. #{route.first_station.name} - #{route.last_station.name}"
    end  
    @route = @routes[gets.chomp.to_i - 1]
  end  
end
    
Interface.new.start!
# train1 = PassengerTrain.new('12345')
# train2 = CargoTrain.new('54321')
# train3 = PassengerTrain.new('41325')
# vagon1 = PassengerVagon.new('1234567', 50)
# vagon2 = CargoVagon.new('7654321', 30)
# vagon3 = PassengerVagon.new('7162534', 40)
# train1.add_vagon(vagon1)
# train2.add_vagon(vagon2)
# train3.add_vagon(vagon3)
# volhov = Station.new("Volhov")
# mga = Station.new("Mga")
# spb = Station.new("Spb")
# volhov.park_train(train1)
# mga.park_train(train2)
# spb.park_train(train3)  
# Station.all_stations



         
