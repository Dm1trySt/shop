# encoding: utf-8
#
# Класс Книга
class Book < Product

  # Изменение параметров
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  # Возвращает название произведения и автора
  def info
    "Книга #{@title}, автор: #{@author_name}"
  end

  # Заполнение данных о товаре
  def read_from_console

    # Ввод название
    puts "Укажите название книги"
    @title = STDIN.gets.chomp

    # Ввод режиссера
    puts "Укажите имя автора"
    @author_name = STDIN.gets.chomp
  end

  # Добавляем данные о книге в xml
  def to_xml
    # Наследуем переменные родителя
    product = super

    # Добовляем переменные класса фильм
    product.add_element('book', {
        'title' => @title,
        'author_name' => @author_name,
    })

    return product
  end
end
