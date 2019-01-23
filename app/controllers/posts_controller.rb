class PostsController < ApplicationController
  def index
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @response = api.all

    @tags = api.tags
    @documents = @response.results
  end

  def show
    api = Prismic.api('https://remori.cdn.prismic.io/api')
    @document = api.getByUID("image-post", params[:id])

    render text: "Not found", status: :not_found if @document.nil?
  end
end
