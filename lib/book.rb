class Book < Product

  #   # attr_accessor - позволяет как считывать так и записывать параметры :title, :genre и :author
  attr_accessor  :title, :genre, :author

  def initialize(params)
    # Берем 2 параметра из родительского класса
    # цена и кол-во на складе
    super

    # Добавляем свои параметры
    # название, жанр, автор
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  # Обновление информации
  def update(params)
    # Наследуем параметры метода у родительского класса
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  # Преобразование данных в строку
  def to_s
    return "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{@price}, (#{@amount})"
  end
end
