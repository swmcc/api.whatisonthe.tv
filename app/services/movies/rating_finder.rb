module Movies
  class RatingFinder
    PREFERRED_COUNTRIES = ['global', 'gbr'].freeze

    def self.find_ratings(releases)
      PREFERRED_COUNTRIES.each do |country|
        rating = find_ratings_by_country(releases, country)
        return rating if rating
      end
      ''
    end

    private

    def self.find_ratings_by_country(ratings, country)
      return '' unless ratings
      rating = ratings.find { |r| r['country'] == country }
      rating['name'] if rating
    end
  end
end
