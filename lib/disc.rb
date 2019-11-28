class Disk < Product

  # Изменение параметров
  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  # Возвращает исполнителя, название и жанр
  def info
    "Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end
end