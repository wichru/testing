module MovieServices
  class MovieDetails
    include HTTParty
    base_uri "https://pairguru-api.herokuapp.com/api/v1/movies"

    def initialize(title)
      @title = title
    end

    def details
      self.class.get("/#{set_title}.json").parsed_response["data"]["attributes"]
    end

    private

    def set_title
      words = @title.split(" ")
      if words.length == 1
        @title
      else
        words.map(&:capitalize).join("%20")
      end
    end
  end
end
