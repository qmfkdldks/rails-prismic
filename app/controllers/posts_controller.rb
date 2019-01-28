class PostsController < ApplicationController
  def index
    @response = prismic.all

    @tags = prismic.tags
    @documents = @response.results
  end

  # Render post fetching from prismic
  # @param [type] document's type
  # @param [id] uid of the document
  def show
    @document = prismic.get_by_uid(params[:type], params[:id])
    raise ActionController::RoutingError.new('Not Found') if @document.nil?

    @tags = @document.tags
  end

  private
  def prismic
    Prismic.api('https://remori.cdn.prismic.io/api')
  end
end
