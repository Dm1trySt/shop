# encoding: utf-8
#
# (с) goodprogrammer.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'rexml/document'

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disc'
require_relative 'lib/product_collection'


# Че за переменная ???
total_price = 0

# .read_from_xml - что длеает метод ????
products = Product.read_from_xml('data/products.xml')

# Хранит ответ пользователя
choice = nil

# Пока пользователь не ввел x
while choice != 'x'

  #todo
  Product.showcase(products)

  # Ввод от пользователя
  choice = STDIN.gets.chomp

  # Проверка корректности введенных данных
  if choice != 'x' && choice.to_i < products.size && choice.to_i >= 0

    # Записываем выбранный продукт
    product = products[choice.to_i]

    # Суммируем цены выбранных продуктов
    # .buy todo
    total_price += product.buy
  end
end

# Вывод итога
puts "Спасибо за покупку! С Вас #{total_price} руб."
