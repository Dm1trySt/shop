# encoding: utf-8
#
# Класс-родитель Товар
class Product

  # Конструктор (цена,кол-во)
  def initialize(price, amount)
    @price = price
    @amount_available = amount
  end

  # Вывод цены
  def price
    @price
  end

  def update(option)
  end

  def info
  end

  # Вывод инофрмации о товаре
  def show
    "#{info} - #{@price} руб. [осталось: #{@amount_available}]"
  end

  # Вывод списка товаров
  def self.showcase(products)
    puts "Что вы хотите купить? \n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "x. Покинуть магазин\n\n"
  end

  # Информация о покупке
  def buy
    if @amount_available > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      # Количество товара
      @amount_available -= 1
      price
    else
      puts "К сожалению #{info}, больше нет"
      return 0
    end
  end

  # Чтение из XML файла
  def self.read_from_xml(file_name)
    # Путь до файла
    file_path = File.dirname(__FILE__ ) + "/" + file_name

    # Файл не найден
    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end

    # Открываем файл и передаем его в парсер
    file = File.new(file_path,"r:UTF-8")
    doc = REXML::Document.new(file)

    # Закрываем файл
    file.close

    # Массив с результатом
    result = []

    # хз
    product = nil

    # Найдем все теги product в теге products
    doc.elements.each("products/product") do |content|

      # Из каждого продукта извлечем его цену и количество на складе
      price = content.attributes["price"].to_i
      amount_available = content.attributes["amount_available"].to_i

      # В каждом теге product может быть только 1 book, disc или movie
      # Тег book
      content.elements.each_entry("book") do |book_content|
        # Внутри тега book мы можем прочитать его аттрибуты
        product = Book.new(price,amount_available)
        product.update(
                   title: book_content.attributes["title"],
                   author_name: book_content.attributes["author_name"]
        )
      end

      # Тег movie
      content.elements.each_entry("movie") do |movie_content|
        # Внутри тега book мы можем прочитать его аттрибуты
        product = Movie.new(price,amount_available)
        product.update(
            title: movie_content.attributes["title"],
            author_name: movie_content.attributes["director_name"],
            year: movie_content.attributes["year"]
        )
      end

      # Тег disc
      content.elements.each_entry("disk") do |disk_content|
        # Внутри тега book мы можем прочитать его аттрибуты
        product = Disk.new(price,amount_available)
        product.update(
            album_name: disk_content.attributes["album_name"],
            artist_name: disk_content.attributes["artist_name"],
            genre: disk_content.attributes["genre"]
        )
      end

      # Запись найденных товаров
      result.push(product)
    end

    # Вернем результат
    return result

  end
end
