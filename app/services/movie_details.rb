class MovieDetails
  include HTTParty
  base_uri "https://pairguru-api.herokuapp.com/api/v1/movies"

  # def initialize(service, page)
  #   @options =  query: { site: service, page: page }
  # end
  #
  # def movie_poster(title)
  #   self.class.get("/#{title}.jpg")
  # end

  def self.title(title)
    get("/#{title}.json").parsed_response["data"]["attributes"]["title"]
  end

  def self.plot(title)
    get("/#{title}.json").parsed_response["data"]["attributes"]["plot"]
  end

  def self.poster(title)
    get("/#{title}.json").parsed_response["data"]["attributes"]["poster"]
  end

  def self.rating(title)
    get("/#{title}.json").parsed_response["data"]["attributes"]["rating"]
  end
end
