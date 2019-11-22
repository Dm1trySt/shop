class Movie < Product

  # attr_accessor - позволяет как считывать так и записывать параметры :title, :year и :producer
  attr_accessor  :title, :year, :producer

  def initialize(params)
   # Берем 2 параметра из родительского класса
   # цена и кол-во на складе
    super

    # Добавляем свои параметры
    # название, год создания, режисер
    @title = params[:title]
    @year = params[:year]
    @producer = params[:producer]
  end

  # Обновление информации
  def update(params)
    # Наследуем параметры метода у родительского класса
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @producer = params[:producer] if params[:producer]
  end

  def self.from_file(file_name)
   lines = File.readlines(file_name, encoding: "UTF-8").map { |l| l.chomp  }

   self.new(
       title: lines[0],
       producer: lines[1],
       year: lines[2].to_i,
       price: lines[3].to_i,
       amount: lines[4].to_i
   )

  end

  # Преобразование данных в строку
  def to_s
      return "Фильм \"#{@title}\", #{@year}, реж. #{@producer}, #{@price}, (#{@amount})"
  end
end
