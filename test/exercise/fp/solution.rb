module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_ratings = array.map do |film|
          rating_kinopoisk = film['rating_kinopoisk'].to_f
          countries = (film['country'] || '').split(',')

          rating_kinopoisk.positive? && countries.length >= 2 ? rating_kinopoisk : nil
        end.compact

        rating_sum = films_ratings.reduce(0) { |accumulator, film_rating| accumulator + film_rating }

        films_ratings.length.positive? ? rating_sum / films_ratings.length : 0
      end

      def chars_count(films, threshold)
        search_symbol = 'и'

        films_names = films.map { |film| film['rating_kinopoisk'].to_f >= threshold ? film['name'] : nil }.compact

        films_names.reduce(0) do |accumulator, film_name|
          accumulator + film_name.count(search_symbol)
        end
      end
    end
  end
end
