class Movie < Product

  # Изменение параметров
  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  # Возвращает строку с названием фильма, режиссёром и годом выхода
  def info
    "Фильм #{@title}, реж. #{@director_name} (#{@year})"
  end

  # Заполнение данных о товаре
  def read_from_console

    # Ввод название
    puts "Укажите название фильма"
    @title = STDIN.gets.chomp

    # Ввод режиссера
    puts "Укажите имя режиссера"
    @director_name = STDIN.gets.chomp

    # Ввод даты
    puts "Укажите дату выхода фильма"
    @year = STDIN.gets.chomp.to_i
  end

  # Добавляем данные о фильме в xml
  def to_xml
    # Наследуем переменные родителя
    product = super

    # Добовляем переменные класса фильм
    product.add_element('movie', {
        'title' => @title,
        'director_name' => @director_name,
        'year' => @year
    })

    return product
  end



end