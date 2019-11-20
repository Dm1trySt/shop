require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'

# Передаем параметры о цене и о кол-ве товара на складе
leon = Movie.new(price: 990, amount: 5)

# Вывод цены товара
puts "Фильм Леон стоит #{leon.price} руб."
