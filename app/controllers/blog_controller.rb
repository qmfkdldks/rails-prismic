class BlogController < ApplicationController
  def home
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.all
    @documents = response.results
  end
end
