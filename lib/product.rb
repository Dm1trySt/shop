# encoding: utf-8
#
# Класс-родитель Товар
class Product
  attr_accessor :price, :amount

  # Конструктор
  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  # Вывод параметров на экран
  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  # Изменение параметров
  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  # Абстрактный метод
  # raise - выведет сообщение об ошибке
  # (в нашем случае - NotImplementedError)
  def self.from_file(file_path)
    raise NotImplementedError
  end
end
