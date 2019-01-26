class PrismicService
  def initialize()
    @api = Prismic.api('https://remori.cdn.prismic.io/api')
  end

  # Get all documents regardless of their type or id
  def all
    @api.all
  end

  def tags
    @api.tags
  end

  def page
    @api.page
  end

  def results_per_page
    @api.results_per_page
  end

  def results_size
    @api.results_size
  end

  def total_results_size
    @api.total_results_size
  end

  def total_pages
    @api.total_pages
  end

  def next_page
    @api.next_page
  end

  def prev_page
    @api.prev_page
  end

  def results
    @api.results
  end

  # Fetch documents and information from prismic server using predicates.
  #
  # @param function_sym [Symbol] a predicate that takes arguments (:at, :not :any :in :fulltext :has :missing :similar :near).
  # @param *arg [Strings] arguments taken by the predicates.
  # @return [Prismic::Response] it contains page info and documents.
  def query(function_sym, *arg)
    predicate = Prismic::Predicates.send(function_sym, *arg)
    # response.results[0] contains the document content
    @api.query(predicate)
  end
end
