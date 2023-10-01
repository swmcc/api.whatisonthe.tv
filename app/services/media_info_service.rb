class MediaInfoService
  require 'tvdb_api'

  def self.find_or_fetch_by_external_id(external_id)
    movie = find_movie(external_id)
    return movie if movie

    response = fetch_movie_details(external_id)
    create_movie_from_response(external_id, response) if response
  end

  def self.find_movie(external_id)
    Movie.find_by(external_id: external_id)
  end

  def self.fetch_movie_details(external_id)
    id = extract_id_from_external_id(external_id)
    fetch_details_from_third_party(id)
  end

  def self.extract_id_from_external_id(external_id)
    external_id.split('-').last
  end

  def self.create_movie_from_response(external_id, response)
    Movie.create(
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

  def self.fetch_details_from_third_party(id)
    api = TVDBApi.new
    response = api.movie(id)
    response['data']
  rescue StandardError => e
    Rails.logger.error "Error fetching movie from third-party API: #{e.message}"
    nil
  end
end
