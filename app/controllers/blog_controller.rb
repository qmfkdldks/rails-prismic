class BlogController < ApplicationController
  def home
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    response = api.query(Prismic::Predicates.at("document.type", "image-post"))
    @documents = response.results
  end
end
