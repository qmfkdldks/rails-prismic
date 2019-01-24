class PrismicService
  def initialize()
    @api = Prismic.api('https://remori.cdn.prismic.io/api')
  end

  # Get all documents regardless of their type or id
  def all
    @api.all
  end

  # Get all existing tags
  def tags
    @api.tags
  end

  # Does meta programming...
  def query(function_sym, *arg)
    predicate = Prismic::Predicates.send(function_sym, *arg)
    # response.results[0] contains the document content
    @api.query(predicate)
  end
end
