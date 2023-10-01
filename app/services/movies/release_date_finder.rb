module Movies
  class ReleaseDateFinder
    PREFERRED_COUNTRIES = ['global', 'gbr'].freeze

    def self.find_release_date(releases)
      PREFERRED_COUNTRIES.each do |country|
        date = find_date_by_country(releases, country)
        return date if date
      end
      ''
    end

    private

    def self.find_date_by_country(releases, country)
      release = releases.find { |r| r['country'] == country }
      release['date'] if release
    end
  end
end
