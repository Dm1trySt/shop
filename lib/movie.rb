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
  # Преобразование данных в строку
  def to_s
      return "Фильм \"#{@title}\", #{@year}, реж. #{@producer}, #{@price}, (#{@amount})"
  end
end
