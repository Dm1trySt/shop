require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'

# Путь до папки с программой
current_path = File.dirname(__FILE__ )

# Путь до файла + вызов метода
film = Movie.from_file(current_path + '/data/movie/01.txt')
book = Book.from_file(current_path + '/data/book/01.txt')

puts book.to_s
puts film.to_s