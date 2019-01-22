# Here we should test integration specs. We should evaluate whether the third party api is responding well.

require 'rails_helper'

RSpec.describe Prismic::API, type: :request do
  describe "#all" do
    it "should return all documents"  do
      api = Prismic.api('https://remori.cdn.prismic.io/api')
      @response = api.all
      @documents = @response.results

      expect(@documents.size).to be > 0
    end
  end
end
