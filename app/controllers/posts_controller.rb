class PostsController < ApplicationController
  def index
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.all
    @documents = @response.results
  end

  def show
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.getByUID("image-post", params[:id])
    puts @response.inspect
  end
end
