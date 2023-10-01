module Movies
  class OverviewFinder
    def self.find_english_overview(translations)
      overview_translations = translations['overviewTranslations']
      english_overview = overview_translations.find { |overview| overview['language'] == 'eng' }
      english_overview ? english_overview['overview'] : ''
    end
  end
end
