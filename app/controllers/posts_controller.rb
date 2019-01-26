class PostsController < ApplicationController
  def index
    prismic = PrismicService.new
    @response = prismic.all

    @tags = prismic.tags
    @documents = @response.results
  end

  # Render post fetching from prismic
  # @param [type] document's type
  # @param [id] uid of the document
  def show
    prismic = PrismicService.new
    documents = prismic.query(:at, "my.#{params[:type]}.uid", params[:id])
    @document = documents.first
    raise ActionController::RoutingError.new('Not Found') if @document.nil?

    @tags = @document.tags
  end
end
