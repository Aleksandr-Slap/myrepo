puts "Введите 1, если вы хотите создать станцию, поезд, вагон или маршрут"
puts "Введите 2, если вы хотите произвести операции с созданными объектами"
puts "Введите 3, если вы хотите вывести текущие данные об оъектах"
puts "Введите 0, если хотите закончить программу"

choice = gets.chomp

while choice != "0"

  case choice


  when "1"
    puts "Введите 1, если вы хотите создать станцию(создайте минимум две станции)"
    puts "Введите 2, если вы хотите создать маршрут"
    puts "Введите 3, если вы хотите создать пассажирский поезд"
    puts "Введите 4, если вы хотите создать почтовый поезд"
    puts "Введите 5, если вы хотите создать пассажирский вагон"
    puts "Введите 6, если вы хотите создать почтовый вагон"

    choice = gets.chomp

    if choice = "1"
      stations = []
      puts "Введите название станции"
      name_of_station = gets.chomp
      Station.new(name_of_station)
      puts "Вы создали станцию " + "#{Station.new(name_of_station)}"
      stations << Station.new(name_of_station)
      p
    elsif choice == "2"
      all_stations = []
      intermediate_stations = []
      puts "Что бы создать маршрут, вы должны были создать как минимум 2 станции"
      puts "Введите имя первой станции"
      first_station = gets.chomp
      puts "Введите имя второй станции"
      last_station = gets.chomp
      puts "По желанию добавте промежуточные станции"
      intermediate_station = gets.chomp
      intermediate_stations << intermediate_station
      Route.new(first_station,last_station)
      all_stations << [first_station] + intermediate_station + [last_station] 
      puts "Маршрут создан: #{all_stations}"
    elsif choice == "3"
      trains = []
      puts "Введите номер поезда"
      train_number = gets.chomp 
      PassengerTrain.new(train_number)
      puts "Вы создали пассажирский поезд " + "#{PassengerTrain.new(train_number)}"
      trains << PassengerTrain.new(train_number)
    elsif choice == "4"
      trains = []
      # trains_cargo = []
      puts "Введите номер вагона"
      train_cargo_number = gets.chomp 
      CargoTrain.new(train_cargo_number)
      puts "Вы создали пассажирский поезд " + "#{CargoTrain.new(train_cargo_number)}"
      trains << CargoTrain.new(train_cargo_number)
      puts trains.size 
    elsif choice == "5"
      vagons = []
      puts "Введите номер вагона"
      vagon_pass_number = gets.chomp
      PassengerVagon.new(vagon_pass_number)
      puts "Вы создали пассажирский вагон " + "#{PassengerVagon.new(vagon_pass_number)}"
      vagons << PassengerVagon.new(vagon_pass_number)
      puts vagons.size
    elsif choice == "6"
      vagons = []
      puts "Введите номер вагона"
      vagon_cargo_number = gets.chomp
      CargoVagon.new(vagon_cargo_number)
      puts "Вы создали пассажирский вагон " + "#{CargoVagon.new(vagon_cargo_number)}"
      vagons << CargoVagon.new(vagon_cargo_number)
      puts vagons.size
    end
  when "2" 
    puts "Введите 1, если вы хотите назначить маршрут для поезда"
    puts "Введите 2, если вы хотите проследовать на следующую станцию"
    puts "Введите 3, если вы хотите проследовать на предыдущую станцию"
    puts "Введите 4, если вы хотите прицепить вагон к пассажирскому поезду"
    puts "Введите 5, если вы хотите прицепить вагон к почтовому поезду"
    puts "Введите 5, если вы хотите отцепить вагон от почтового поезда"
    puts "Введите 5, если вы хотите прицепить вагон к почтовому поезду"
    puts "Введите 5, если вы хотите увеличить скорость"
    puts "Введите 5, если вы хотите снизить скорость"
    puts "Введите 5, если вы хотите остановиться"

    choice = gets.chomp
    #Код работы назначения маршрута, прицепки отцепки вагонов...
  when "3"
    puts "Введите 1, если вы хотите посмотреть поездана на станции"
    puts "Введите 2, если вы хотите текущую станцию"
    puts "Введите 3, если вы хотите предыдущую станцию"
    puts "Введите 4, если вы хотите количество вагонов пассжирского поезда"
    puts "Введите 5, если вы хотите количество вагонов почтового поезда"
    puts "Введите 6, если вы хотите ...."
    
    #Код вот этого всего!!!

    choice = gets.chomp
  end
end



