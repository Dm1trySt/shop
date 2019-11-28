# encoding: utf-8
#
# Класс Книга
class Book < Product

  # Изменение параметров
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  # Возвращает название произведения и автора
  def info
    "Книга #{@title}, автор: #{@author_name}"
  end
end
