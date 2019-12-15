class Movie < ApplicationRecord
  has_many :posts, primary_key: 'movie_id', foreign_key: 'movie_id',dependent: :destroy
  validates :movie_id, uniqueness: true

   def self.search(title)
    require 'uri'
    require 'net/http'
    url = URI.parse URI.encode("https://api.themoviedb.org/3/search/movie?page=1&query=#{title}&language=ja-JA&api_key=30dd6dfe595c6a70ddad14ddc4b58ac5")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request.body = "{}"

    response = http.request(request)
    result = JSON.parse(response.body)
  end

  def self.details(id)
    # require 'uri'
    # require 'net/http'
    # url = URI("https://api.themoviedb.org/3/movie/#{id}?language=ja-JA&api_key=30dd6dfe595c6a70ddad14ddc4b58ac5")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # request = Net::HTTP::Get.new(url)
    # request.body = "{}"
    # response = http.request(request)
    # result = JSON.parse(response.body)



    require 'uri'
    require 'net/http'
    require 'json'
    require 'open-uri'

    # uri = URI.parse("https://api.themoviedb.org/3/movie/#{id}?language=ja-JA&api_key=30dd6dfe595c6a70ddad14ddc4b58ac5")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = uri.scheme === "https"
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # req = Net::HTTP::Get.new(uri)
    # response = http.request(req)
    # result = JSON.parse(response.body)
    # Movie.create(title:result.title)

    require 'themoviedb-api'
    Tmdb::Api.key("30dd6dfe595c6a70ddad14ddc4b58ac5")
    Tmdb::Api.language("ja")
    result = Tmdb::Movie.detail(id)
    movie = Movie.find_or_create_by(movie_id:result.id,title:result.title)
  end

  def to_param
    movie_id.to_s
  end
end
