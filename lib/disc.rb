class Disc < Product

  # Изменение параметров
  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  # Возвращает исполнителя, название и жанр
  def info
    "Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end

  # Заполнение данных о товаре
  def read_from_console

    # Ввод название
    puts "Укажите имя исполнителя"
    @artist_name = STDIN.gets.chomp

    # Ввод режиссера
    puts "Укажите название альбома"
    @album_name = STDIN.gets.chomp

    # Ввод даты
    puts "Укажите музыкальный жанр"
    @genre = STDIN.gets.chomp.to_i
  end

  # Добавляем данные о диске в xml
  def to_xml
    # Наследуем переменные родителя
    product = super

    # Добовляем переменные класса фильм
    product.add_element('disk', {
        'album_name' => @album_name,
        '@artist_name' => @artist_name,
        'genre' => @genre
    })



    return product
  end
end