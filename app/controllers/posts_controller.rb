class PostsController < ApplicationController
  def index
    prismic = PrismicService.new
    @response = prismic.all

    @tags = prismic.tags
    @documents = @response.results
  end

  def show
    # api = Prismic.api('https://remori.cdn.prismic.io/api')
    # @document = api.getByUID("image-post", params[:id])
    documents = PrismicService.new.query(:at, "my.image-post.uid", params[:id])
    @document = documents.first
    raise ActiveRecord::RecordNotFound, "Record not found." if @document.nil?

    @tags = @document.tags
  end
end
