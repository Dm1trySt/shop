# Родительский класс
class Product

  # Принимаем параметры товаров : цена и кол-во на складе
  attr_reader :price, :amount

  # записываем цену товара и его кол-во
  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

end
