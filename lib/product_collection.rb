# Класс может считывать все нужные продукты из
# подкатегорий films, books и т.д.
class ProductCollection

  # Ассоциативный массив, где ключем является символ, а значением — другой ассоцаитивный
  # массив с название папки (где лежат файлы этого типа) и ссылкой на класс.
  PRODUCT_TYPES = {
      film: {dir: 'films', class: Film},
      book: {dir: 'books', class: Book}
  }

  # Крнструктор
  def initialize(products = [])
    @products = products
  end

  # Считывает из указанной в параметрах папки все файлы:
  # фильмы — из dir_path + '/films';
  # книги — из dir_path + '/books'.
  def self.from_dir(dir_path)

    # Все найденные продукты будем записывать в этот массив
    products = []

    # Пройдемся по каждой паре ключ-значение из константы PRODUCT_TYPES и
    # поочередно запишем эту пару соответственно в переменные type и hash.
    #
    # Сначала в type будет :film, а в hash — {dir: 'films', class: Film}, потом
    # в type будет :books, а в hash — {dir: 'books', class: Book}
    #
    PRODUCT_TYPES.each do |type, hash|

      # Путь к директории с файлами нужного типа
      product_dir = hash[:dir]

      # Получим из хэша объект нужного класса
      product_class = hash[:class]

      # Dir[] - возвращает массив с путями фалов *.txt
      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|

        # Записываем в продукты строки из фала.txt
        products << product_class.from_file(path)
      end
    end

    # Вызываем конструктор этого же класса (ProductCollection) и передаем ему
    # заполненный массив продуктов
    self.new(products)
  end

  # Простой метод, чтобы достать все продукты коллекции
  def to_a
    @products
  end

  # Метод sort! меняет экземпляр класса ProductCollection (меняет порядок)
  # продуктов, поэтому он назвал с восклицательным знаком. Этот
  # метод принимает на вход ассоциативный массив, в котором могут быть два
  # ключа: :by и :order. Например, чтобы отсортировать продукты по возрастанию
  # цены, можно вызвать этот метод так:
  #
  # collection.sort!(by: :price, order: :asc)
  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self
  end
end
