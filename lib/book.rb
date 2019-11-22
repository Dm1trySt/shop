class Book < Product

  attr_reader :title, :genre, :author

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

  # Преобразование данных в строку
  def to_s
    return "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{@price}, (#{@amount})"
  end
end
