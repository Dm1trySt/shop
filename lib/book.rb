# encoding: utf-8
#
# Класс Книга
class Book < Product
  attr_accessor :title, :genre, :author

  # Метод класса from_file считывает данные о книге из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)

    # .map  - принимает перечисляемый объект (строки) и применяет к каждому
    # объекту .chomp(убриает знак переноса строки \n)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    # Запись строк в переменные
    self.new(
        title: lines[0],
        genre: lines[1],
        author: lines[2],
        price: lines[3],
        amount: lines[4]
    )
  end

  # конструктор
  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  # Вывод данных о книге на экрна
  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  # Изменение параметров
  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
