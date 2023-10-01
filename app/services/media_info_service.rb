class MediaService
  require 'tvdb_api'

  def self.find_or_fetch_by_external_id(external_id)
    movie = Movie.find_by(external_id: external_id)

    unless movie
      response = fetch_details_from_third_party(external_id.split('-').last)
      return nil unless response 

      movie = Movie.create(
        external_id: external_id,
        name: response['name'],
        synopsis: 'synopsis',
        image_url: 'image_url',
        status: 'status',
        released: 'released',
        rating: 'rating',
        runtime: 'runtime',
        production_company: 'production_company',
      )
    end

    movie
  end

  private

  def self.fetch_details_from_third_party(id)
    api = TVDBApi.new
    response = api.movie(id) 

    JSON.parse(response)
  rescue => e
    Rails.logger.error "Error fetching movie from third-party API: #{e.message}"
    nil
  end
end
