require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'


products = []

products << Movie.new(
    title: 'Леон',
    year: '1994',
    producer: 'Люк Бессон',
    price: 990,
    amount: 5
)

products << Movie.new(
    title: 'Дурак',
    year: '2014',
    producer: 'Юрий Быков',
    price: 390,
    amount: 1
)

products << Book.new(
    title: 'Идиот',
    genre: 'роман',
    author: 'Федор Достоевский',
    price: 1500,
    amount: 10
)

products.each do |product|
  puts product
end