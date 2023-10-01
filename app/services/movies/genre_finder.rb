module Movies
  class GenreFinder
    def self.find_genres(genres)
      genre_names = extract_genre_names(genres)
      join_genre_names(genre_names)
    end

    private

    def self.extract_genre_names(genres)
      genres.map { |genre| genre['name'] }
    end

    def self.join_genre_names(genre_names)
      genre_names.join(', ')
    end
  end
end
