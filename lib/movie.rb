class Movie < Product

  attr_reader :title, :year, :producer

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

  # Преобразование данных в строку
  def to_s
      return "Фильм \"#{@title}\", #{@year}, реж. #{@producer}, #{@price}, (#{@amount})"
  end
end
