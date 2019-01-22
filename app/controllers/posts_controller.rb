class PostsController < ApplicationController
  def index
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.all

    puts api.inspect 
    @tags = api.tags
    @documents = @response.results
  end

  def show
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.getByUID("image-post", params[:id])
  end
end
