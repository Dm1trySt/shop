require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'


film = Movie.new(
    title: 'Леон',
    producer: 'Люк Бессон',
    price: 990,
    amount: 5
)

# Дата фильма
film.year = 1994

film.update(amount: 5)


kniga = Book.new(
    title: 'Идиот',
    genre: 'роман',
    amount: 10
)

# Автор книги
kniga.author = "Федька Достоевский"

# Изменение информации о книге
kniga.update(author: "Федор Достоевский", price: 1500)

puts kniga
puts film