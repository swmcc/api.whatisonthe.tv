module Movies
  class StudioFinder
    def self.find_studios(studios)
      studio_names = extract_studio_names(studios)
      join_studio_names(studio_names)
    end

    private

    def self.extract_studio_names(studios)
      studios.map { |studio| studio['name'] }
    end

    def self.join_studio_names(studio_names)
      studio_names.join(', ')
    end
  end
end
