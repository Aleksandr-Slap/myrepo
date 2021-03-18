class Interface
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

      choice = gets.chomp
      case choice
      when "1"
        create_objects
      when "2"
        manage_objects
      when "3"
        show_objects
      when "0"
        break
      end
    end
  end

  def create_objects
    puts "Введите 1, если вы хотите создать станцию(создайте минимум две станции)"
    puts "Введите 2, если вы хотите создать маршрут"
    puts "Введите 3, если вы хотите создать пассажирский поезд"
    puts "Введите 4, если вы хотите создать почтовый поезд"
    puts "Введите 5, если вы хотите создать пассажирский вагон"
    puts "Введите 6, если вы хотите создать почтовый вагон"
    puts "Введите 0, если вы хотите выйти из меню"

    choice = gets.chomp.to_i

    case choice
    when 0
      return
    when 1
      create_station
    when "2"
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
  end

  def create_station
    puts "Введите название станции"
    name_of_station = gets.chomp
    new_station = Station.new(name_of_station)
    puts "Вы создали станцию " + "#{new_station}"
    @stations << new_station
    p
  end

  def create_route
    puts "Что бы создать маршрут, вы должны были создать как минимум 2 станции"
    @stations.each_with_index do |index, station|
      puts "#{index + 1}. #{station.name}"
    end
    # 1. Москва
    # 2. Спб
    puts "Введите порядковый номер первой станции"
    first_station = @stations[gets.chomp.to_i - 1]
    puts "Введите имя второй станции"
    last_station = @stations[gets.chomp.to_i - 1]
    route = Route.new(first_station, last_station)
    @routes << route
    puts "Маршрут создан: #{route.first_station} - #{route.last_station}"
  end
end
