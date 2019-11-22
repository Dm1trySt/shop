# Родительский класс
class Product

  # attr_accessor - позволяет как считывать так и записывать параметры :price и :amount
  attr_accessor  :price, :amount

  # записываем цену товара и его кол-во
  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  # Обновление информации
  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  # Считываение данных из файла
  def self.from_file(file_name)
    # raise - вызывает RuntimeError, который в свою очередь выведет текст "NotImplementedError"
    # в качестве ошибки
   raise NotImplementedError
  end

end
