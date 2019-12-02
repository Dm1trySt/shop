require 'rexml/document'

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disc'
require_relative 'lib/product_collection'

# типы продуктов (книги, фильмы, диски)
product_types = Product.product_types

# Выбор пользователя
choice = -1

# Если введенныая цифра не попадает в диапозон допустимых, повторяем
until (0..product_types.count).include?(choice)
  puts "Какой товар вы хотите добавить?"
  product_types.each_with_index do |type, index|
    puts "#{index}: #{type}"
  end
  choice = STDIN.gets.to_i
end

# Ввод цены
puts "Введите цену продукта:"
price = STDIN.gets.to_i

# Ввод кол-ва
puts "Введите количество продукта на складе:"
amount = STDIN.gets.to_i

# Создаем продукт
product = product_types[choice].new(price, amount)

product.read_from_console

# Сохраним новый продукт в файл с продуктами
product.save_to_xml('data/products.xml')


