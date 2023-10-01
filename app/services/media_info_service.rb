class MediaInfoService
  require 'tvdb_api'

  def self.find_or_fetch_by_external_id(external_id)
    movie = Movie.find_by(external_id: external_id)

    unless movie
      response = fetch_details_from_third_party(external_id.split('-').last)
      return nil unless response

      movie = Movie.create(
        external_id: external_id,
        name: response['name'],
        status: response['status']['name'],
        poster: response['image'],
        runtime: response['runtime'],
        synopsis: Movies::OverviewFinder.find_english_overview(response['translations']),
        released: Movies::ReleaseDateFinder.find_release_date(response['releases']),
        genres: Movies::GenreFinder.find_genres(response['genres']),
        rating: Movies::RatingFinder.find_ratings(response['contentRatings']),
        studio: Movies::StudioFinder.find_studios(response['studios'])
      )
    end

    movie
  end

  private

  def self.fetch_details_from_third_party(id)
    api = TVDBApi.new
    response = api.movie(id)

    puts response['data']
    response['data']
  rescue => e
    Rails.logger.error "Error fetching movie from third-party API: #{e.message}"
    nil
  end
end
